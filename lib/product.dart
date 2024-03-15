class product {
  final String Id,
      ProductName,
      ProductCode,
      Img,
      unitprice,
      Qty,
      Totalprice,
      Createdata;

  product(this.Id, this.ProductName, this.ProductCode, this.Img, this.unitprice,
      this.Qty, this.Totalprice, this.Createdata);

 factory product.tojson(Map<String,dynamic> e){
    return product(
      e['_id'],
      e['ProductName'],
      e['ProductCode'],
      e['Img'],
      e['UnitPrice'],
      e['Qty'],
      e['TotalPrice'],
      e['CreatedDate'],
    );
  }
}
