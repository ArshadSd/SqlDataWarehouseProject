
/* Stored procedure : Load bronze layer
   This loads data into bronze schema from CSV files.

   It performs:
   Truncating bronze tables .
   Bulk inserting to load data.
   
   How to execute : Run command 'EXEC bronze.load_bronze'
  */
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;

	BEGIN TRY 
		PRINT '--------------------';
		PRINT 'lOADING BRONZE LAYER';
		PRINT '-----------------------';

		PRINT '--------------------';
		PRINT 'lOADING CRM TABLES';
		PRINT '-----------------------';

		SET @start_time = GETDATE();

		PRINT '>> Truncating table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;


		PRINT '>> Inserting data into table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Arshad\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating table: bronze.crm_prd_info';

		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting data into table: bronze.crm_prd_info';

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Arshad\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-------------------------';

		SET @start_time = GETDATE();

		PRINT '>> Truncating table: bronze.crm_sales_details';

		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting data into table: bronze.crm_sales_details';

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Arshad\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-------------------------';

		PRINT '--------------------';
		PRINT 'lOADING ERP TABLES';
		PRINT '-----------------------';

		SET @start_time = GETDATE();

		PRINT '>> Truncating table: bronze.erp_cust_az12';

		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting data into table: bronze.erp_cust_az12';

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Arshad\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-------------------------';

		SET @start_time = GETDATE();

		PRINT '>> Truncating table: bronze.erp_loc_a101';


		

		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting data into table: bronze.erp_loc_a101';

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Arshad\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-------------------------';

		SET @start_time = GETDATE();

		PRINT '>> Truncating table: bronze.erp_px_cat_g1v2';

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting data into table: bronze.erp_px_cat_g1v2';

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Arshad\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-------------------------';

	END TRY 
	BEGIN CATCH 
			PRINT '-------------------------------------------';
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
			PRINT 'Error Message' + ERROR_MESSAGE();
			PRINT 'Error Message' + CAST( ERROR_NUMBER() AS NVARCHAR);
			PRINT 'Error Message' + CAST( ERROR_STATE() AS NVARCHAR);
			PRINT '-------------------------------------------';
	END CATCH
END
