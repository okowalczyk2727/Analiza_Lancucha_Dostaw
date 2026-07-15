USE [SupplyChainAnalytics]
GO
/****** Obiekt: Table [dw].[DIM_Category] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DIM_Category](
	[category_ID] [tinyint] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DIM_Category] PRIMARY KEY CLUSTERED 
(
	[category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[DIM_Customer] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DIM_Customer](
	[customer_ID] [smallint] NOT NULL,
	[customer_segment] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DIM_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[dim_date] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[dim_date](
	[date_key] [date] NOT NULL,
	[full_date] [date] NOT NULL,
	[year] [smallint] NOT NULL,
	[quarter] [nvarchar](2) NOT NULL,
	[month_number] [tinyint] NOT NULL,
	[month_name] [nvarchar](50) NOT NULL,
	[year_month] [nvarchar](50) NOT NULL,
	[week_of_year] [tinyint] NOT NULL,
	[day_of_week_number] [tinyint] NOT NULL,
	[day_name] [nvarchar](50) NOT NULL,
	[is_weekend] [bit] NOT NULL,
 CONSTRAINT [PK_DIM_Date] PRIMARY KEY CLUSTERED 
(
	[date_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[DIM_Geography] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DIM_Geography](
	[market] [nvarchar](50) NOT NULL,
	[order_city] [nvarchar](50) NOT NULL,
	[order_country] [nvarchar](50) NOT NULL,
	[order_region] [nvarchar](50) NOT NULL,
	[order_state] [nvarchar](50) NOT NULL,
	[geography_ID] [smallint] NOT NULL,
	[warehouse_ID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DIM_Geography] PRIMARY KEY CLUSTERED 
(
	[geography_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[DIM_Product] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DIM_Product](
	[product_ID] [int] NOT NULL,
	[product_category_ID] [tinyint] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DIM_Product] PRIMARY KEY CLUSTERED 
(
	[product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[DIM_Shipping_mode] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DIM_Shipping_mode](
	[shipping_mode] [nvarchar](50) NOT NULL,
	[shipping_mode_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_DIM_Shipping_mode] PRIMARY KEY CLUSTERED 
(
	[shipping_mode_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[dim_supplier] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[dim_supplier](
	[supplier_id] [nvarchar](50) NOT NULL,
	[supplier_name] [nvarchar](50) NOT NULL,
	[supplier_region] [nvarchar](50) NOT NULL,
	[performance_tier] [nvarchar](50) NOT NULL,
	[planned_lead_time_days] [tinyint] NOT NULL,
	[on_time_probability] [decimal](9, 6) NOT NULL,
	[target_fill_rate] [decimal](9, 6) NOT NULL,
 CONSTRAINT [PK_DIM_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[DIM_Warehouse] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DIM_Warehouse](
	[warehouse_ID] [nvarchar](50) NOT NULL,
	[warehouse_name] [nvarchar](50) NOT NULL,
	[region_group] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DIM_Warehouse] PRIMARY KEY CLUSTERED 
(
	[warehouse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[fact_inventory_daily] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[fact_inventory_daily](
	[snapshot_date_key] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[warehouse_id] [nvarchar](50) NOT NULL,
	[opening_stock] [int] NOT NULL,
	[received_quantity] [int] NOT NULL,
	[demand_quantity] [int] NOT NULL,
	[fulfilled_quantity] [int] NOT NULL,
	[unfulfilled_quantity] [int] NOT NULL,
	[closing_stock] [int] NOT NULL,
	[open_po_quantity] [int] NOT NULL,
	[purchase_order_placed_quantity] [int] NOT NULL,
	[safety_stock] [int] NOT NULL,
	[reorder_point] [int] NOT NULL,
	[target_stock] [int] NOT NULL,
	[unit_cost] [decimal](18, 4) NOT NULL,
	[inventory_value] [decimal](18, 2) NOT NULL,
	[stockout_flag] [bit] NOT NULL,
	[below_safety_stock_flag] [bit] NOT NULL,
	[excess_stock_flag] [bit] NOT NULL,
	[days_of_supply] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_FAKT_Inventory_daily] PRIMARY KEY CLUSTERED 
(
	[snapshot_date_key] ASC,
	[product_id] ASC,
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[fact_purchase_orders] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[fact_purchase_orders](
	[purchase_order_id] [nvarchar](50) NOT NULL,
	[order_date_key] [date] NOT NULL,
	[expected_receipt_date_key] [date] NOT NULL,
	[actual_receipt_date_key] [date] NOT NULL,
	[product_id] [int] NOT NULL,
	[supplier_id] [nvarchar](50) NOT NULL,
	[warehouse_id] [nvarchar](50) NOT NULL,
	[ordered_quantity] [smallint] NOT NULL,
	[received_quantity] [smallint] NOT NULL,
	[unit_cost] [decimal](18, 4) NOT NULL,
	[purchase_order_value] [decimal](18, 2) NOT NULL,
	[received_value] [decimal](18, 2) NOT NULL,
	[delay_days] [tinyint] NOT NULL,
	[is_on_time] [bit] NOT NULL,
	[is_in_full] [bit] NOT NULL,
	[is_otif] [bit] NOT NULL,
 CONSTRAINT [PK_FAKT_Purchase_orders] PRIMARY KEY CLUSTERED 
(
	[purchase_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[FAKT_OrderLines] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FAKT_OrderLines](
	[type] [nvarchar](50) NOT NULL,
	[days_shipping_real] [tinyint] NOT NULL,
	[days_shipping_scheduled] [tinyint] NOT NULL,
	[delivery_status] [nvarchar](50) NOT NULL,
	[category_ID] [tinyint] NOT NULL,
	[customer_ID] [smallint] NOT NULL,
	[geography_ID] [smallint] NOT NULL,
	[order_date] [datetime2](7) NOT NULL,
	[order_ID] [int] NOT NULL,
	[order_cardprod_ID] [int] NOT NULL,
	[order_item_discount] [decimal](18, 2) NOT NULL,
	[order_item_discount_rate] [decimal](9, 6) NOT NULL,
	[order_item_id] [int] NOT NULL,
	[order_item_product_price] [decimal](18, 2) NOT NULL,
	[order_item_profit_ratio] [decimal](9, 6) NOT NULL,
	[order_item_quantity] [tinyint] NOT NULL,
	[sales] [decimal](18, 2) NOT NULL,
	[order_item_total] [decimal](18, 2) NOT NULL,
	[order_profit_per_order] [decimal](18, 2) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[product_card_ID] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[shipping_date] [datetime2](7) NOT NULL,
	[shipping_mode_ID] [tinyint] NOT NULL,
	[scheduled_shipping_date] [datetime2](7) NOT NULL,
	[is_canceled] [bit] NOT NULL,
	[is_late] [bit] NOT NULL,
	[delay_days] [tinyint] NOT NULL,
	[unit_cost] [decimal](18, 4) NOT NULL,
	[warehouse_ID] [nvarchar](50) NOT NULL,
	[order_date_key] [date] NOT NULL,
	[shipping_date_key] [date] NOT NULL,
	[scheduled_shipping_date_key] [date] NOT NULL,
 CONSTRAINT [PK_FAKT_OrderLines] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [dw].[FAKT_Shipments] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FAKT_Shipments](
	[order_ID] [int] NOT NULL,
	[order_date] [datetime2](7) NOT NULL,
	[shipping_date] [datetime2](7) NOT NULL,
	[scheduled_shipping_date] [datetime2](7) NOT NULL,
	[customer_ID] [smallint] NOT NULL,
	[geography_ID] [smallint] NOT NULL,
	[shipping_mode_ID] [tinyint] NOT NULL,
	[delivery_status] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[days_shipping_real] [tinyint] NOT NULL,
	[days_shipping_scheduled] [tinyint] NOT NULL,
	[delay_days] [tinyint] NOT NULL,
	[is_canceled] [bit] NOT NULL,
	[order_quantity] [tinyint] NOT NULL,
	[net_sales] [decimal](18, 2) NOT NULL,
	[profit_amount] [decimal](18, 2) NOT NULL,
	[is_on_time] [bit] NOT NULL,
	[order_date_key] [date] NOT NULL,
	[shipping_date_key] [date] NOT NULL,
	[scheduled_shipping_date_key] [date] NOT NULL,
 CONSTRAINT [PK_FAKT_Shipments] PRIMARY KEY CLUSTERED 
(
	[order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Obiekt: Table [mart].[mart_product_classification] Data skryptu: 7/15/2026 11:32:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mart].[mart_product_classification](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[category_id] [tinyint] NOT NULL,
	[net_sales] [decimal](18, 2) NOT NULL,
	[profit_amount] [decimal](18, 2) NOT NULL,
	[lost_sales_value] [decimal](18, 2) NOT NULL,
	[cumulative_sales_share] [decimal](9, 6) NOT NULL,
	[abc_class] [nvarchar](50) NOT NULL,
	[average_monthly_demand] [decimal](18, 4) NOT NULL,
	[demand_standard_deviation] [decimal](18, 4) NOT NULL,
	[coefficient_of_variation] [decimal](18, 6) NOT NULL,
	[xyz_class] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MART_Product_classification] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dw].[DIM_Geography]  WITH CHECK ADD  CONSTRAINT [FK_DIM_Geography_Warehouse] FOREIGN KEY([warehouse_ID])
REFERENCES [dw].[DIM_Warehouse] ([warehouse_ID])
GO
ALTER TABLE [dw].[DIM_Geography] CHECK CONSTRAINT [FK_DIM_Geography_Warehouse]
GO
ALTER TABLE [dw].[DIM_Product]  WITH CHECK ADD  CONSTRAINT [FK_DIM_Product_Category] FOREIGN KEY([product_category_ID])
REFERENCES [dw].[DIM_Category] ([category_ID])
GO
ALTER TABLE [dw].[DIM_Product] CHECK CONSTRAINT [FK_DIM_Product_Category]
GO
ALTER TABLE [dw].[fact_inventory_daily]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Product] FOREIGN KEY([product_id])
REFERENCES [dw].[DIM_Product] ([product_ID])
GO
ALTER TABLE [dw].[fact_inventory_daily] CHECK CONSTRAINT [FK_Inventory_Product]
GO
ALTER TABLE [dw].[fact_inventory_daily]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_SnapshotDate] FOREIGN KEY([snapshot_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[fact_inventory_daily] CHECK CONSTRAINT [FK_Inventory_SnapshotDate]
GO
ALTER TABLE [dw].[fact_inventory_daily]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Warehouse] FOREIGN KEY([warehouse_id])
REFERENCES [dw].[DIM_Warehouse] ([warehouse_ID])
GO
ALTER TABLE [dw].[fact_inventory_daily] CHECK CONSTRAINT [FK_Inventory_Warehouse]
GO
ALTER TABLE [dw].[fact_purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_ActualReceiptDate] FOREIGN KEY([actual_receipt_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[fact_purchase_orders] CHECK CONSTRAINT [FK_PurchaseOrders_ActualReceiptDate]
GO
ALTER TABLE [dw].[fact_purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_ExpectedReceiptDate] FOREIGN KEY([expected_receipt_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[fact_purchase_orders] CHECK CONSTRAINT [FK_PurchaseOrders_ExpectedReceiptDate]
GO
ALTER TABLE [dw].[fact_purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_OrderDate] FOREIGN KEY([order_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[fact_purchase_orders] CHECK CONSTRAINT [FK_PurchaseOrders_OrderDate]
GO
ALTER TABLE [dw].[fact_purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Product] FOREIGN KEY([product_id])
REFERENCES [dw].[DIM_Product] ([product_ID])
GO
ALTER TABLE [dw].[fact_purchase_orders] CHECK CONSTRAINT [FK_PurchaseOrders_Product]
GO
ALTER TABLE [dw].[fact_purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Supplier] FOREIGN KEY([supplier_id])
REFERENCES [dw].[dim_supplier] ([supplier_id])
GO
ALTER TABLE [dw].[fact_purchase_orders] CHECK CONSTRAINT [FK_PurchaseOrders_Supplier]
GO
ALTER TABLE [dw].[fact_purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Warehouse] FOREIGN KEY([warehouse_id])
REFERENCES [dw].[DIM_Warehouse] ([warehouse_ID])
GO
ALTER TABLE [dw].[fact_purchase_orders] CHECK CONSTRAINT [FK_PurchaseOrders_Warehouse]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Customer] FOREIGN KEY([customer_ID])
REFERENCES [dw].[DIM_Customer] ([customer_ID])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_Customer]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Geography] FOREIGN KEY([geography_ID])
REFERENCES [dw].[DIM_Geography] ([geography_ID])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_Geography]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_OrderDate] FOREIGN KEY([order_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_OrderDate]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Product] FOREIGN KEY([product_card_ID])
REFERENCES [dw].[DIM_Product] ([product_ID])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_Product]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_ScheduledShippingDate] FOREIGN KEY([scheduled_shipping_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_ScheduledShippingDate]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_ShippingDate] FOREIGN KEY([shipping_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_ShippingDate]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_ShippingMode] FOREIGN KEY([shipping_mode_ID])
REFERENCES [dw].[DIM_Shipping_mode] ([shipping_mode_ID])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_ShippingMode]
GO
ALTER TABLE [dw].[FAKT_OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Warehouse] FOREIGN KEY([warehouse_ID])
REFERENCES [dw].[DIM_Warehouse] ([warehouse_ID])
GO
ALTER TABLE [dw].[FAKT_OrderLines] CHECK CONSTRAINT [FK_OrderLines_Warehouse]
GO
ALTER TABLE [dw].[FAKT_Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Customer] FOREIGN KEY([customer_ID])
REFERENCES [dw].[DIM_Customer] ([customer_ID])
GO
ALTER TABLE [dw].[FAKT_Shipments] CHECK CONSTRAINT [FK_Shipments_Customer]
GO
ALTER TABLE [dw].[FAKT_Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Geography] FOREIGN KEY([geography_ID])
REFERENCES [dw].[DIM_Geography] ([geography_ID])
GO
ALTER TABLE [dw].[FAKT_Shipments] CHECK CONSTRAINT [FK_Shipments_Geography]
GO
ALTER TABLE [dw].[FAKT_Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_OrderDate] FOREIGN KEY([order_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[FAKT_Shipments] CHECK CONSTRAINT [FK_Shipments_OrderDate]
GO
ALTER TABLE [dw].[FAKT_Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ScheduledShippingDate] FOREIGN KEY([scheduled_shipping_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[FAKT_Shipments] CHECK CONSTRAINT [FK_Shipments_ScheduledShippingDate]
GO
ALTER TABLE [dw].[FAKT_Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ShippingDate] FOREIGN KEY([shipping_date_key])
REFERENCES [dw].[dim_date] ([date_key])
GO
ALTER TABLE [dw].[FAKT_Shipments] CHECK CONSTRAINT [FK_Shipments_ShippingDate]
GO
ALTER TABLE [dw].[FAKT_Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ShippingMode] FOREIGN KEY([shipping_mode_ID])
REFERENCES [dw].[DIM_Shipping_mode] ([shipping_mode_ID])
GO
ALTER TABLE [dw].[FAKT_Shipments] CHECK CONSTRAINT [FK_Shipments_ShippingMode]
GO
ALTER TABLE [mart].[mart_product_classification]  WITH CHECK ADD  CONSTRAINT [FK_ProductClassification_Product] FOREIGN KEY([product_id])
REFERENCES [dw].[DIM_Product] ([product_ID])
GO
ALTER TABLE [mart].[mart_product_classification] CHECK CONSTRAINT [FK_ProductClassification_Product]
GO
