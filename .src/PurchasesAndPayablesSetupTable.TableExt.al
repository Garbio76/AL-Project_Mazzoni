namespace AL_Project_Mazzoni.Default_Publisher;
using Microsoft.Purchases.Setup;
tableextension 50000 PurchasesAndPayablesSetUpTable extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "Doc./Post. Date After Wrk Date"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Data doc. e/o data reg. successiva alla workdate';
            InitValue = false;
        }
    }
}