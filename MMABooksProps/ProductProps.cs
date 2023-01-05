using System;
using System.Collections.Generic;
using System.Text;

using MMABooksTools;
using DBDataReader = MySql.Data.MySqlClient.MySqlDataReader;

using System.Text.Json;
using System.Text.Json.Serialization;


namespace MMABooksProps
{
    [Serializable()]
    public class ProductProps : IBaseProps
    {
        public int ProductId { get; set; } = 0;

        public string ProductCode { get; set; } = "";

        public string Description { get; set; } = "";

        public decimal UnitPrice { get; set; } = 0m;

        public int OnHandQuantity { get; set; } = 0;

       public int ConcurrencyID { get; set; } = 0;
        #region Auto-implemented Properties
        public string Code { get; set; } = "";

        public string Name { get; set; } = "";

        /// <summary>
        /// ConcurrencyID. Don't manipulate directly.
        /// </summary>
       
        #endregion
        public object Clone()
        {
            ProductProps p = new ProductProps();
            p.ProductId = this.ProductId;
            p.ProductCode = this.ProductCode;
            p.Description = this.Description;
            p.UnitPrice = this.UnitPrice;
            p.OnHandQuantity = this.OnHandQuantity;
            p.ConcurrencyID = this.ConcurrencyID;
           
            return p;
        }

        // this is always the same ... so I should have made IBaseProps and abstract class
        public string GetState()
        {
            string jsonString;
            jsonString = JsonSerializer.Serialize(this);
            return jsonString;
        }

        public void SetState(string jsonString)
        {
            ProductProps p = JsonSerializer.Deserialize<ProductProps>(jsonString);
            p.ProductId = this.ProductId;
            p.ProductCode = this.ProductCode;
            p.Description = this.Description;
            p.UnitPrice = this.UnitPrice;
            p.OnHandQuantity = this.OnHandQuantity;
            p.ConcurrencyID = this.ConcurrencyID;
        }

        public void SetState(DBDataReader dr)
        {
            this.ProductId = (int)dr["ProductID"];
            this.ProductCode = ((string)dr["ProductCode"]).Trim();
            this.Description = (string)dr["Description"];
            this.UnitPrice = (decimal)dr["UnitPrice"];
            this.OnHandQuantity = (int)dr["OnHandQuantity"];
            this.ConcurrencyID = (Int32)dr["ConcurrencyID"];
        }
    }
}
