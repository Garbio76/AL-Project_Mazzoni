codeunit 50001 SalesHeaderDatesCheck
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnBeforeSendToPosting, '', true, true)]
    local procedure SalesHeaderDatesCheck(var SalesHeader: Record "Sales Header")

    var
        lRcSalesAndReceivablesSetup: Record "Sales & Receivables Setup";
    
    begin

       lRcSalesAndReceivablesSetup.Get();
        case lRcSalesAndReceivablesSetup."Same Doc./Occurr./Post. Date" of
            true:
                if (SalesHeader."Document Date" <> SalesHeader."Operation Occurred Date") and (SalesHeader."Document Date" <> SalesHeader."Posting Date") or
                 (SalesHeader."Operation Occurred Date" <> SalesHeader."Document Date") and (SalesHeader."Operation Occurred Date" <> SalesHeader."Posting Date") or
                 (SalesHeader."Posting Date" <> SalesHeader."Document Date") and (SalesHeader."Posting Date" <> SalesHeader."Operation Occurred Date")
then
                    Message('Data documento, data esecuzione operazione e data di registrazione non coincidono.');

        end;
    end;
}

