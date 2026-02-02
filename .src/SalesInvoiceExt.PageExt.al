namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Sales.Document;
pageextension 50007 SalesInvoiceExt extends "Sales Invoice"
{
    layout
    {
        modify("QGS Prepayment Amount")
        {
            trigger
            OnAfterValidate()
            begin
                Message('Necessario eseguire il ricalcolo dei pagamenti!');
            end;
        }
    }
}