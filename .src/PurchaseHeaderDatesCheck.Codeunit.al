codeunit 50000 PurchaseHeaderDatesCheck
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnBeforeSendToPosting, '', true, true)]
    local procedure PurchaseHeaderDatesCheck(var PurchaseHeader: Record "Purchase Header")

    var
        lRcPurchasesAndPayablesSetup: Record "Purchases & Payables Setup";

    begin

        lRcPurchasesAndPayablesSetup.Get();
        case lRcPurchasesAndPayablesSetup."Doc./Post. Date After Wrk Date" of
            true:
                if PurchaseHeader."Document Date" > WorkDate() then
                    Message('Data documento successiva alla workdate.');
        end;
        if PurchaseHeader."Posting Date" > WorkDate() then
            Message('Data registrazione successiva alla workdate.');
    end;



}