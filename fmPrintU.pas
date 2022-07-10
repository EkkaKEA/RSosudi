unit fmPrintU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt;

type
  TfmPrint = class(TForm)
    QuickRep1: TQuickRep;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrint: TfmPrint;

implementation

{$R *.DFM}

end.
