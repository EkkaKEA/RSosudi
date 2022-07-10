program RSosudi;

uses
  Forms,
  Osnov in 'Osnov.pas' {Sosudi},
  About in 'About.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSosudi, Sosudi);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
