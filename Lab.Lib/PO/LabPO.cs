using Lab.Lib.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab.Lib.PO
{
    internal class LabPO :Ede.Uof.Utility.Data.BasePersistentObject
    {

        internal DataTable GetProductList()
        {
            //從web.config點選連線字串
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings[""].ConnectionString;

            //重新建構資料庫物件，將連線指到北風資料庫
            m_db = new Ede.Uof.Utility.Data.DatabaseHelper(connStr);

            string cmdTxt = @"SELECT  [ProductID]
                              ,[ProductName]
                              ,[UnitPrice]  
                          FROM [dbo].[Products]";


            DataTable dt = new DataTable();

            //執行SQL，將執行結果放在Table上

            return dt;


        }


        internal DataTable GetOrderDetail(string orderId)
        {
            string conn = System.Configuration.
     ConfigurationManager.ConnectionStrings["connTOERP"].ConnectionString;

            m_db = new Ede.Uof.Utility.Data.DatabaseHelper(conn);

            string cmdTxt = @" SELECT 
	 [OrderID] , 
	 [ProductID] , 
	 [UnitPrice] , 
	 [Quantity] , 
	 [Discount]  
 FROM [dbo].[Order Details] 
WHERE 
	[OrderID] = @OrderID";

            this.m_db.AddParameter("@OrderID", orderId);

            DataTable dt = new DataTable();
            dt.Load(this.m_db.ExecuteReader(cmdTxt), LoadOption.OverwriteChanges);

            m_db = new Ede.Uof.Utility.Data.DatabaseHelper();

            return dt;


        }

        internal DataTable GetOrderList(string keyword)
        {
            string conn = System.Configuration.
                ConfigurationManager.ConnectionStrings["connTOERP"].ConnectionString;

            m_db = new Ede.Uof.Utility.Data.DatabaseHelper(conn);

            string cmdTxt = @" SELECT 
	                     [OrderID] , 
	                     [CustomerID] , 
	                     [EmployeeID] , 
	                     [OrderDate] , 
	                     [RequiredDate] , 
	                     [ShippedDate] , 
	                     [ShipVia] , 
	                     [Freight] , 
	                     [ShipName] , 
	                     [ShipAddress] , 
	                     [ShipCity] , 
	                     [ShipRegion] , 
	                     [ShipPostalCode] , 
	                     [ShipCountry]  
                     FROM [dbo].[Orders] 
                    WHERE 
                            1=1 ";


            if (keyword != "")
            {

                cmdTxt += " AND [OrderID] = @OrderID";

                this.m_db.AddParameter("@OrderID", keyword);
            }

            DataTable dt = new DataTable();
            dt.Load(this.m_db.ExecuteReader(cmdTxt), LoadOption.OverwriteChanges);
            m_db = new Ede.Uof.Utility.Data.DatabaseHelper();
            return dt;


        }

        internal void InsertLabFormData(LabFormDataSet.TB_LAB_DLL_FORMRow dr)
        {
            string cmdTxt = @"  INSERT INTO [dbo].[TB_LAB_DLL_FORM]  
                        (	 [TASK_ID] , 
	                         [DOC_NBR] , 
	                         [CATEGORY_ID] , 
	                         [ITEM_NAME] , 
	                         [AMOUNT] , 
	                         [FORM_RESULT]  
                        ) 
                         VALUES 
                         (	 @TASK_ID , 
	                         @DOC_NBR , 
	                         @CATEGORY_ID , 
	                         @ITEM_NAME , 
	                         @AMOUNT , 
	                         @FORM_RESULT  
                        )";

            this.m_db.AddParameter("@TASK_ID", dr.TASK_ID);
            this.m_db.AddParameter("@DOC_NBR", dr.DOC_NBR);
            this.m_db.AddParameter("@CATEGORY_ID", dr.CATEGORY_ID);
            this.m_db.AddParameter("@ITEM_NAME", dr.ITEM_NAME);
            this.m_db.AddParameter("@AMOUNT", dr.AMOUNT);
            this.m_db.AddParameter("@FORM_RESULT", dr.FORM_RESULT);

            this.m_db.ExecuteNonQuery(cmdTxt);

        }


    }
}
