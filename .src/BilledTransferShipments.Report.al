namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Inventory.Transfer;
using Microsoft.Sales.History;
report 50003 BilledTransferShipments
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Spedizioni trasferimento fatturate';
    DefaultRenderingLayout = BilledTransferShipments;

    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "Posting Date";

            column(No_; "No.") { IncludeCaption = true; }
            column(Posting_Date; "Posting Date") { IncludeCaption = true; }
            column(Transfer_from_Code; "Transfer-from Code") { IncludeCaption = true; }
            column(Transfer_to_Code; "Transfer-to Code") { IncludeCaption = true; }
            column(Transfer_Order_No_; "Transfer Order No.") { IncludeCaption = true; }
            column(Transfer_Order_Date; "Transfer Order Date") { IncludeCaption = true; }

            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemLinkReference = "Transfer Shipment Header";
                DataItemLink = "External Document No." = field("No.");

                column(No_Invoice; "No.") { IncludeCaption = true; }
                column(Document_Date; "Document Date") { IncludeCaption = true; }
                column(External_Document_No_; "External Document No.") { IncludeCaption = true; }
                column(Bill_to_Customer_No_; "Bill-to Customer No.") { IncludeCaption = true; }
                column(Bill_to_Name; "Bill-to Name") { IncludeCaption = true; }
                column(Amount; "Amount") { IncludeCaption = true; }
                column(Amount_Including_VAT; "Amount Including VAT") { IncludeCaption = true; }
                column(Remaining_Amount; "Remaining Amount") { IncludeCaption = true; }
            }
        }
    }
    rendering
    {
        layout("BilledTransferShipments")
        {
            Type = RDLC;
            LayoutFile = 'BilledTransferShipments.rdl';
        }
    }
}