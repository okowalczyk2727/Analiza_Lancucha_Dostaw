USE [SupplyChainAnalytics]
GO
/****** Obiekt: View [mart].[vw_dim_product] Data skryptu: 7/15/2026 11:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [mart].[vw_dim_product]
AS
SELECT
    p.product_ID AS product_id,
    p.product_name,
    p.product_category_ID AS category_id,
    c.category_name,
    pc.net_sales,
    pc.profit_amount,
    pc.lost_sales_value,
    pc.cumulative_sales_share,
    pc.abc_class,
    pc.average_monthly_demand,
    pc.demand_standard_deviation,
    pc.coefficient_of_variation,
    pc.xyz_class
FROM dw.DIM_Product AS p
LEFT JOIN dw.DIM_Category AS c
    ON p.product_category_ID = c.category_ID
LEFT JOIN mart.mart_product_classification AS pc
    ON p.product_ID = pc.product_id;
GO
/****** Obiekt: View [mart].[vw_fact_inventory] Data skryptu: 7/15/2026 11:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [mart].[vw_fact_inventory]
AS
SELECT
    snapshot_date_key,
    product_id,
    warehouse_id,

    opening_stock,
    received_quantity,
    demand_quantity,
    fulfilled_quantity,
    unfulfilled_quantity,
    closing_stock,
    open_po_quantity,
    purchase_order_placed_quantity,

    safety_stock,
    reorder_point,
    target_stock,

    unit_cost,
    inventory_value,

    stockout_flag,
    below_safety_stock_flag,
    excess_stock_flag,
    days_of_supply
FROM dw.fact_inventory_daily;
GO
/****** Obiekt: View [mart].[vw_fact_purchase_orders] Data skryptu: 7/15/2026 11:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [mart].[vw_fact_purchase_orders]
AS
SELECT
    purchase_order_id,

    order_date_key,
    expected_receipt_date_key,
    actual_receipt_date_key,

    product_id,
    supplier_id,
    warehouse_id,

    ordered_quantity,
    received_quantity,

    unit_cost,
    purchase_order_value,
    received_value,

    delay_days,
    is_on_time,
    is_in_full,
    is_otif
FROM dw.fact_purchase_orders;
GO
/****** Obiekt: View [mart].[vw_fact_sales] Data skryptu: 7/15/2026 11:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [mart].[vw_fact_sales]
AS
SELECT
    f.order_item_id,
    f.order_ID AS order_id,

    f.order_date_key,
    f.shipping_date_key,
    f.scheduled_shipping_date_key,

    f.product_card_ID AS product_id,
    f.customer_ID AS customer_id,
    f.geography_ID AS geography_id,
    f.shipping_mode_ID AS shipping_mode_id,
    f.warehouse_ID AS warehouse_id,

    f.[type] AS payment_type,
    f.delivery_status,
    f.order_status,

    f.days_shipping_real,
    f.days_shipping_scheduled,
    f.delay_days,

    f.order_item_quantity AS quantity,
    f.order_item_product_price AS unit_price,
    f.order_item_discount AS discount_amount,
    f.order_item_discount_rate AS discount_rate,

    f.sales AS gross_sales,
    f.order_item_total AS net_sales,
    f.order_profit_per_order AS profit_amount,
    f.order_item_profit_ratio AS profit_ratio,
    f.unit_cost,

    f.is_canceled,
    f.is_late,

    CAST
    (
        CASE
            WHEN f.order_status NOT IN
                 (N'CANCELED', N'SUSPECTED_FRAUD')
            THEN 1
            ELSE 0
        END
        AS bit
    ) AS is_valid_order
FROM dw.FAKT_OrderLines AS f;
GO
/****** Obiekt: View [mart].[vw_fact_shipments] Data skryptu: 7/15/2026 11:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [mart].[vw_fact_shipments]
AS
SELECT
    f.order_ID AS order_id,

    f.order_date_key,
    f.shipping_date_key,
    f.scheduled_shipping_date_key,

    f.customer_ID AS customer_id,
    f.geography_ID AS geography_id,
    f.shipping_mode_ID AS shipping_mode_id,

    f.delivery_status,
    f.order_status,

    f.days_shipping_real,
    f.days_shipping_scheduled,
    f.delay_days,

    f.order_quantity,
    f.net_sales,
    f.profit_amount,

    f.is_canceled,
    f.is_on_time,

    CAST
    (
        CASE
            WHEN f.order_status NOT IN
                 (N'CANCELED', N'SUSPECTED_FRAUD')
            THEN 1
            ELSE 0
        END
        AS bit
    ) AS is_valid_order
FROM dw.FAKT_Shipments AS f;
GO
