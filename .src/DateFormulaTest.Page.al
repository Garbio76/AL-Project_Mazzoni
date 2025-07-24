page 50000 DateFormulaTest
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;


    layout
    {
        area(Content)
        {
            group("Input")
            {
                field("Input Date"; InputDate)
                {
                    Caption = 'Input Date';
                    ToolTip = 'Specifies the input date';
                }

                field("Date Formula"; DateFormula)
                {
                    Caption = 'Date Formula';
                    ToolTip = 'Specifies the date formula';
                }
            }
            group("Output")

            {
                field("Output Date"; OutputDate)

                {
                    Caption = 'Output Date';
                    ToolTip = 'Specifies the result date';
                }

            }
        }
    }

    actions
    {
        area(Processing)

        {
            action("Calculate Date")
            {
                Caption = 'Calculate Date';
                ToolTip = 'Calculate Date';
                Image = Action;
                trigger OnAction()

                begin
                    if (InputDate <> 0D) and (Format(DateFormula) <> '' )then

                    OutputDate := CalcDate(DateFormula, InputDate)


                end;
            }
        }

    }





    var
        DateFormula: DateFormula;
        InputDate, OutputDate : Date;


}