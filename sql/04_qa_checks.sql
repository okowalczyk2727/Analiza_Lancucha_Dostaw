USE [SupplyChainAnalytics];
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE OR ALTER VIEW [qa].[vw_row_counts]
AS
    SELECT N'dw.DIM_Category' AS object_name, COUNT_BIG(*) AS row_count FROM dw.DIM_Category
    UNION ALL SELECT N'dw.DIM_Customer', COUNT_BIG(*) FROM dw.DIM_Customer
    UNION ALL SELECT N'dw.DIM_Date', COUNT_BIG(*) FROM dw.dim_date
    UNION ALL SELECT N'dw.DIM_Geography', COUNT_BIG(*) FROM dw.DIM_Geography
    UNION ALL SELECT N'dw.DIM_Product', COUNT_BIG(*) FROM dw.DIM_Product
    UNION ALL SELECT N'dw.DIM_Shipping_mode', COUNT_BIG(*) FROM dw.DIM_Shipping_mode
    UNION ALL SELECT N'dw.DIM_Supplier', COUNT_BIG(*) FROM dw.dim_supplier
    UNION ALL SELECT N'dw.DIM_Warehouse', COUNT_BIG(*) FROM dw.DIM_Warehouse
    UNION ALL SELECT N'dw.FAKT_OrderLines', COUNT_BIG(*) FROM dw.FAKT_OrderLines
    UNION ALL SELECT N'dw.FAKT_Shipments', COUNT_BIG(*) FROM dw.FAKT_Shipments
    UNION ALL SELECT N'dw.FAKT_Inventory_daily', COUNT_BIG(*) FROM dw.fact_inventory_daily
    UNION ALL SELECT N'dw.FAKT_Purchase_orders', COUNT_BIG(*) FROM dw.fact_purchase_orders
    UNION ALL SELECT N'mart.mart_product_classification', COUNT_BIG(*) FROM mart.mart_product_classification;
GO

CREATE OR ALTER VIEW [qa].[vw_orphan_keys]
AS
    SELECT N'FAKT_OrderLines' AS fact_table, N'product_id' AS key_name, COUNT_BIG(*) AS orphan_count
    FROM dw.FAKT_OrderLines AS f
    LEFT JOIN dw.DIM_Product AS d ON f.product_card_ID = d.product_ID
    WHERE d.product_ID IS NULL

    UNION ALL
    SELECT N'FAKT_OrderLines', N'customer_id', COUNT_BIG(*)
    FROM dw.FAKT_OrderLines AS f
    LEFT JOIN dw.DIM_Customer AS d ON f.customer_ID = d.customer_ID
    WHERE d.customer_ID IS NULL

    UNION ALL
    SELECT N'FAKT_OrderLines', N'geography_id', COUNT_BIG(*)
    FROM dw.FAKT_OrderLines AS f
    LEFT JOIN dw.DIM_Geography AS d ON f.geography_ID = d.geography_ID
    WHERE d.geography_ID IS NULL

    UNION ALL
    SELECT N'FAKT_OrderLines', N'order_date_key', COUNT_BIG(*)
    FROM dw.FAKT_OrderLines AS f
    LEFT JOIN dw.dim_date AS d ON f.order_date_key = d.date_key
    WHERE d.date_key IS NULL

    UNION ALL
    SELECT N'FAKT_Shipments', N'customer_id', COUNT_BIG(*)
    FROM dw.FAKT_Shipments AS f
    LEFT JOIN dw.DIM_Customer AS d ON f.customer_ID = d.customer_ID
    WHERE d.customer_ID IS NULL

    UNION ALL
    SELECT N'FAKT_Shipments', N'geography_id', COUNT_BIG(*)
    FROM dw.FAKT_Shipments AS f
    LEFT JOIN dw.DIM_Geography AS d ON f.geography_ID = d.geography_ID
    WHERE d.geography_ID IS NULL

    UNION ALL
    SELECT N'FAKT_Shipments', N'order_date_key', COUNT_BIG(*)
    FROM dw.FAKT_Shipments AS f
    LEFT JOIN dw.dim_date AS d ON f.order_date_key = d.date_key
    WHERE d.date_key IS NULL

    UNION ALL
    SELECT N'FAKT_Inventory_daily', N'product_id', COUNT_BIG(*)
    FROM dw.fact_inventory_daily AS f
    LEFT JOIN dw.DIM_Product AS d ON f.product_id = d.product_ID
    WHERE d.product_ID IS NULL

    UNION ALL
    SELECT N'FAKT_Inventory_daily', N'warehouse_id', COUNT_BIG(*)
    FROM dw.fact_inventory_daily AS f
    LEFT JOIN dw.DIM_Warehouse AS d ON f.warehouse_id = d.warehouse_ID
    WHERE d.warehouse_ID IS NULL

    UNION ALL
    SELECT N'FAKT_Inventory_daily', N'snapshot_date_key', COUNT_BIG(*)
    FROM dw.fact_inventory_daily AS f
    LEFT JOIN dw.dim_date AS d ON f.snapshot_date_key = d.date_key
    WHERE d.date_key IS NULL

    UNION ALL
    SELECT N'FAKT_Purchase_orders', N'product_id', COUNT_BIG(*)
    FROM dw.fact_purchase_orders AS f
    LEFT JOIN dw.DIM_Product AS d ON f.product_id = d.product_ID
    WHERE d.product_ID IS NULL

    UNION ALL
    SELECT N'FAKT_Purchase_orders', N'supplier_id', COUNT_BIG(*)
    FROM dw.fact_purchase_orders AS f
    LEFT JOIN dw.dim_supplier AS d ON f.supplier_id = d.supplier_id
    WHERE d.supplier_id IS NULL

    UNION ALL
    SELECT N'FAKT_Purchase_orders', N'warehouse_id', COUNT_BIG(*)
    FROM dw.fact_purchase_orders AS f
    LEFT JOIN dw.DIM_Warehouse AS d ON f.warehouse_id = d.warehouse_ID
    WHERE d.warehouse_ID IS NULL

    UNION ALL
    SELECT N'FAKT_Purchase_orders', N'order_date_key', COUNT_BIG(*)
    FROM dw.fact_purchase_orders AS f
    LEFT JOIN dw.dim_date AS d ON f.order_date_key = d.date_key
    WHERE d.date_key IS NULL;
GO

CREATE OR ALTER VIEW [qa].[vw_kpi_reconciliation]
AS
    WITH last_inventory_date AS
    (
        SELECT MAX(snapshot_date_key) AS date_key
        FROM mart.vw_fact_inventory
    )
    SELECT N'Sales' AS area, N'Net Sales' AS metric_name,
           CAST(SUM(CASE WHEN is_valid_order = 1 THEN net_sales ELSE 0 END) AS decimal(38, 6)) AS metric_value
    FROM mart.vw_fact_sales

    UNION ALL
    SELECT N'Sales', N'Profit',
           CAST(SUM(CASE WHEN is_valid_order = 1 THEN profit_amount ELSE 0 END) AS decimal(38, 6))
    FROM mart.vw_fact_sales

    UNION ALL
    SELECT N'Delivery', N'Valid Shipments',
           CAST(SUM(CASE WHEN is_valid_order = 1 THEN 1 ELSE 0 END) AS decimal(38, 6))
    FROM mart.vw_fact_shipments

    UNION ALL
    SELECT N'Delivery', N'On-Time Delivery %',
           CAST(
               1.0 * SUM(CASE WHEN is_valid_order = 1 AND is_on_time = 1 THEN 1 ELSE 0 END)
               / NULLIF(SUM(CASE WHEN is_valid_order = 1 THEN 1 ELSE 0 END), 0)
               AS decimal(38, 6)
           )
    FROM mart.vw_fact_shipments

    UNION ALL
    SELECT N'Inventory', N'Inventory Fill Rate %',
           CAST(1.0 * SUM(fulfilled_quantity) / NULLIF(SUM(demand_quantity), 0) AS decimal(38, 6))
    FROM mart.vw_fact_inventory

    UNION ALL
    SELECT N'Inventory', N'Inventory Value EOP',
           CAST(SUM(i.inventory_value) AS decimal(38, 6))
    FROM mart.vw_fact_inventory AS i
    CROSS JOIN last_inventory_date AS d
    WHERE i.snapshot_date_key = d.date_key

    UNION ALL
    SELECT N'Procurement', N'Purchase Order Value',
           CAST(SUM(purchase_order_value) AS decimal(38, 6))
    FROM mart.vw_fact_purchase_orders

    UNION ALL
    SELECT N'Procurement', N'Supplier OTIF %',
           CAST(1.0 * SUM(CASE WHEN is_otif = 1 THEN 1 ELSE 0 END) / NULLIF(COUNT_BIG(*), 0) AS decimal(38, 6))
    FROM mart.vw_fact_purchase_orders

    UNION ALL
    SELECT N'Procurement', N'Supplier Fill Rate %',
           CAST(1.0 * SUM(received_quantity) / NULLIF(SUM(ordered_quantity), 0) AS decimal(38, 6))
    FROM mart.vw_fact_purchase_orders

    UNION ALL
    SELECT N'Classification', N'Classified Products',
           CAST(COUNT_BIG(*) AS decimal(38, 6))
    FROM mart.mart_product_classification

    UNION ALL
    SELECT N'Classification', N'Lost Sales Value',
           CAST(SUM(lost_sales_value) AS decimal(38, 6))
    FROM mart.mart_product_classification;
GO

SELECT * FROM qa.vw_row_counts ORDER BY object_name;
SELECT * FROM qa.vw_orphan_keys ORDER BY fact_table, key_name;
SELECT * FROM qa.vw_kpi_reconciliation ORDER BY area, metric_name;
GO
