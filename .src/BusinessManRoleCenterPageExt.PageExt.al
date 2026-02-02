namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Finance.RoleCenters;
using System.Integration.PowerBI;
pageextension 50005 BusinessManRoleCenterPageExt extends "Business Manager Role Center"
{
    layout
    {
        addafter(PowerBIEmbeddedReportPart)   // Add changes to page layout here
        {
            part(PowerBIEmbeddedReportPart_1; "Power BI Embedded Report Part")
            {
                AccessByPermission = TableData "Power BI Context Settings" = I;
                ApplicationArea = Basic, Suite;
                SubPageView = where(Context = const('Power BI Report_1'));
            }
            part(PowerBIEmbeddedReportPart_2; "Power BI Embedded Report Part")
            {
                AccessByPermission = TableData "Power BI Context Settings" = I;
                ApplicationArea = Basic, Suite;
                SubPageView = where(Context = const('Power BI Report_2'));
            }
        }
    }
}