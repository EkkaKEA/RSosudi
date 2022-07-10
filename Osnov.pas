 unit Osnov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Math, Grids, Menus, OleAuto, Ole2, ExtCtrls, JvRadioGroup,
  JvDialogs, JvWinDialogs, Mask, JvMaskEdit, JvSpin;


type
  TSosudi = class(TForm)
    MainMenu1: TMainMenu;
    qwe1: TMenuItem;
    N10: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N8: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    JvSaveDialog1: TJvSaveDialog;
    N4: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit13: TEdit;
    ComboBox4: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TJvSpinEdit;
    Edit2: TJvSpinEdit;
    JEdit1: TJvSpinEdit;
    Label5: TLabel;
    JEdit2: TJvSpinEdit;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    JEdit3: TJvSpinEdit;
    JEdit4: TJvSpinEdit;
    Label15: TLabel;
    Label16: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);

    procedure N10Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure N4Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Sosudi: TSosudi;
  R,R1,Rp,L,h,h1,V,Vk,hmax,ht,pr,np: real;
  Vgh, Vrh, Ygp, Yrp, Vgmp: real;
  Ggh, Grh, Go, alfa, Ky, md: real;
  iy, P, Pm, flk, pal, alfa1: integer;
  Nm, PF: string;

implementation

uses About;

{$R *.DFM}

procedure PriceList;
var
  Count,ih,nfont : LongInt;
  S,Sa: String;
  V: Variant;
begin
  nfont:=10;
  V := CreateOleObject('Word.Basic');
  V.FileNew('Normal');
  V.Insert(#13#10);
  Count := 1;

  { Заголовок таблицы }
  V.Font('Courier New Cyr');
  V.FontSize(nfont);
  V.FormatFont(,,,,,,,,,,,,,,,,1,);
  S := 'h, м'   + Chr(9) +
       'Vж, м3'           + Chr(9) +
       'Vг, м3'  + Chr(9) +
       'Gж, кг'+ Chr(9) +
       'Gг, кг' + Chr(9) +
       'Gобщ, кг' + Chr(9) +
       'Ку, %'  + Chr(9) +
       'Alfa, град';
  V.Insert(S);
  V.Insert(#13#10);
  Count := Count + length(S) + 1;

  { Тело таблицы }
  with Sosudi.StringGrid1 do
   begin
  ih:=1;
  while not (ih=Sosudi.StringGrid1.RowCount) do
    begin
      V.Font('Courier New Cyr');
      V.FontSize(nfont);
      S := Cells[0, ih] + Chr(9) +{ Chr(9) это символ табуляции - нужен для преобразования в таблицу }
           Cells[1, ih] + Chr(9) +
           Cells[2, ih] + Chr(9) +
           Cells[3, ih] + Chr(9) +
           Cells[4, ih] + Chr(9) +
           Cells[5, ih] + Chr(9) +
           Cells[6, ih] + Chr(9) +
           Cells[7, ih];
      V.Insert(S);
      V.Insert(#13#10);
      Count := Count + length(S) + 1;
      { + 1 для символа перевода строки }
      ih:=ih+1;
    end;
  V.Font('Courier New Cyr');
  V.FontSize(nfont);
  V.FormatFont(,,,,,,,,,,,,,,,,1,);
  S := 'h, м'   + Chr(9) +
       'Vж, м3'           + Chr(9) +
       'Vг, м3'  + Chr(9) +
       'Gж, кг'+ Chr(9) +
       'Gг, кг' + Chr(9) +
       'Gобщ, кг' + Chr(9) +
       'Ку, %'  + Chr(9) +
       'Alfa, град';
  V.Insert(S);
  V.Insert(#13#10);
  Count := Count + length(S) + 1;
     V.Insert('                                  '+Nm);
     V.Insert(#13#10);
     V.Insert('                                    P= '+floattostr(P)+' кгс/см2');
     V.Insert(#13#10);
  end;
  dec(Count); { так надо }
  V.SetSelRange(1, Count);
  V.TextToTable;
  V.BorderInside;
  V.BorderOutside;
  V.StartOfDocument;
  V.StartOfDocument;
  V.Font('Times New Roman Cyr');
  V.FontSize(16);
  V.FormatFont(,,,,,,,,,,,,,,,,1,);

  { теперь шапку формируем }
  begin
    V.Insert('                   Поинтервальная колибровка сосуда');
    V.Insert(#13#10);
    V.FontSize(16);
    V.Insert('                                  '+Nm);
    V.Insert(#13#10);

    V.Insert(' '); V.Insert(#13#10);

    V.Insert('  R= '+floattostr(R)+' м'+
    '                                     P= '+floattostr(P)+' кгс/см2');
    V.Insert(#13#10);

    V.Insert('  L= '+floattostr(L)+' м'+
    '                                   Vж max= '+floattostr(Vgmp)+' м3');
    V.Insert(#13#10);

    V.Insert('  V= '+floattostr(Vk)+' м3'+
    '                               Yж= '+floattostr(Ygp)+' кг/м3');
    V.Insert(#13#10);

    V.Insert('  P max= '+floattostr(Pm)+' кгс/см2'+
    '                     Yг= '+floattostr(Yrp)+' кг/м3');
    V.Insert(#13#10);
  end;

 {Сохранение файла}
  Sa:=PF;
  V.FileSaveAs(Sa);
//  V.Application.Quit
  V.FileClose;
PostMessage(FindWindow(Nil, 'Microsoft Word'), WM_QUIT, 0, 0);
//  V:=UnAssigned;
  ShowMessage('Создан файл '+Sa);
end;



{Округление до двух цифр}
Function Rn2(Ar: real): real;
var
  V1: real;
begin
 V1:=round(Ar*100)/100;
 Result:=V1;
end;

{Таблица плотностей жидкостей}
Function Yg(Ar: integer): real;
var
  V1: real;
begin
if flk=0 then begin      //кислота плотность жидкости
 Case (Ar) of
 3: V1:=1197.750;
 4: V1:=1182.250;
 5: V1:=1166.750;
 6: V1:=1152.820;
 7: V1:=1140.150;
 8: V1:=1128.732;
 9: V1:=1117.717;
10: V1:=1107.105;
11: V1:=1097.377;
12: V1:=1087.840;
13: V1:=1078.920;
14: V1:=1070.258;
15: V1:=1061.687;
16: V1:=1053.716;
17: V1:=1046.513;
18: V1:=1038.964;
19: V1:=1030.413;
20: V1:=1023.405;
21: V1:=1016.294;
22: V1:=1008.686;
23: V1:=1001.532;
24: V1:=0994.563;
25: V1:=0987.620;
end;
end
else begin
 Case (Ar) of  //амиак плотность жидкости
 3: V1:=652;
 4: V1:=642;
 5: V1:=633;
 6: V1:=627;
 7: V1:=620;
 8: V1:=613;
 9: V1:=607;
10: V1:=603;
11: V1:=599;
12: V1:=595;
13: V1:=591;
14: V1:=587;
15: V1:=583;
16: V1:=579;
17: V1:=576;
18: V1:=573;
19: V1:=569;
20: V1:=565;
21: V1:=561;
22: V1:=557;
23: V1:=553;
24: V1:=549;
25: V1:=545;
end;
end;
if flk=2 then begin      //пропан плотность жидкости
 Case (Ar) of
 3: V1:=549;
 4: V1:=539;
 5: V1:=529;
 6: V1:=520;
 7: V1:=512;
 8: V1:=505;
 9: V1:=498;
10: V1:=492;
11: V1:=486;
12: V1:=480;
13: V1:=475;
14: V1:=468;
15: V1:=462;
16: V1:=457;
17: V1:=453;
18: V1:=448;
19: V1:=443;
20: V1:=439;
21: V1:=434;
22: V1:=429;
23: V1:=425;
24: V1:=420;
25: V1:=415;
end;
end;
 Result:=V1;
end;

{Округление до трех цифр}
Function Rn3(Ar: real): real;
var
  V1: real;
begin
 V1:=round(Ar*1000)/1000;
 Result:=V1;
end;

{Таблица плотностей газов}
Function Yr(Ar: integer): real;
var
  V1: real;
begin
if flk=0 then  begin //кислота плотность газа
 Case (Ar) of
 3: V1:=10.560;
 4: V1:=13.060;
 5: V1:=15.700;
 6: V1:=18.250;
 7: V1:=20.650;
 8: V1:=23.074;
 9: V1:=25.575;
10: V1:=28.174;
11: V1:=30.587;
12: V1:=33.036;
13: V1:=35.580;
14: V1:=38.189;
15: V1:=40.826;
16: V1:=43.435;
17: V1:=45.866;
18: V1:=48.404;
19: V1:=50.231;
20: V1:=53.850;
21: V1:=56.501;
22: V1:=59.204;
23: V1:=62.112;
24: V1:=65.001;
25: V1:=67.776;
end; end
else    begin //амиак плотность газа
 Case (Ar) of
 3: V1:=2.39;
 4: V1:=3.32;
 5: V1:=3.98;
 6: V1:=4.72;
 7: V1:=5.70;
 8: V1:=6.3;
 9: V1:=7.25;
10: V1:=7.80;
11: V1:=8.55;
12: V1:=9.30;
13: V1:=10.00;
14: V1:=10.80;
15: V1:=11.55;
16: V1:=12.30;
17: V1:=13.05;
18: V1:=13.8;
19: V1:=14.5;
20: V1:=15.3;
21: V1:=16.0;
22: V1:=16.8;
23: V1:=17.5;
24: V1:=18.3;
25: V1:=19.0;
end;
end;
if flk=2 then  begin    //пропан плотность газа
 Case (Ar) of
 3: V1:=6.57;
 4: V1:=8.64;
 5: V1:=10.70;
 6: V1:=12.70;
 7: V1:=14.80;
 8: V1:=16.77;
 9: V1:=18.67;
10: V1:=20.71;
11: V1:=22.80;
12: V1:=24.82;
13: V1:=26.80;
14: V1:=29.10;
15: V1:=31.44;
16: V1:=33.29;
17: V1:=35.14;
18: V1:=36.99;
19: V1:=38.84;
20: V1:=40.70;
21: V1:=42.55;
22: V1:=44.40;
23: V1:=46.25;
24: V1:=48.10;
25: V1:=49.96;
end; end;
 Result:=V1;
end;

{Текущий объем жидкости от высоты}
Function Vgrash(Rf,Lf,hf: real): real;
var
  V1,V2: real;
begin
 if (hf>2*R) then hf:=2*R;
 V1:=Rf*Rf*ArcSin((Rf-hf)/Rf);
 V2:=(Rf-hf)*Sqrt(2*Rf*hf-hf*hf);
 V1:=Pi*Rf*Rf/2-V1-V2;
 V2:=(3*Rf-hf)*Pi*hf*hf/6;
 V1:=V2+Lf*V1;
 Result:=V1;
end;

{Текущая высота от бъема жидкости}
Function hrash(Rf,Lf,Vf: real): real;
var
   ij: integer;
   aj, tj, Vj: real;
begin
tj:=0;  aj:=2*R;
While (tj<=2*R) do
begin Vj:=Vgrash(Rf,Lf,tj);
tj:=tj+0.001;
if (Vj<Vf) and (Vgrash(Rf,Lf,(tj+0.001))>Vf) then aj:=tj; end;
Result:=aj;
end;

{Цикл при расчете по процентно}
procedure Cikls(ps:real);
begin
if flk =0 then ht:=hmax*ps/100
else ht:=rn3(hrash(R,L,(V*ps/100)));
 Vgh:=rn3(Vgrash(R,L,ht));
 Vrh:=rn3(V-Vgh);
 Ggh:=rn2(Ygp*Vgh);
 Grh:=rn2(Yrp*Vrh);
 Go:=Ggh+Grh;
 if flk=0 then  Ky:=rn2(100*ht/hmax)
 else Ky:=ps;
 Rp:=(R-ht-np)/R1;
 if (abs(Rp)>1) then Rp:=1;
 alfa:=-rn2(arcsin(Rp)*180/Pi)+pal;

 with Sosudi.StringGrid1 do
 begin
  Cells[0, iy]:=floattostr(ht);
  Cells[1, iy]:=floattostr(Vgh);
  Cells[2, iy]:=floattostr(Vrh);
  Cells[3, iy]:=floattostr(Ggh);
  Cells[4, iy]:=floattostr(Grh);
  Cells[5, iy]:=floattostr(Go);
  Cells[6, iy]:=floattostr(Ky);
  Cells[7, iy]:=floattostr(alfa);
 end;

end;

{Цикл при расчете по высоте}
procedure Cikl(hs:real);
begin
 Vgh:=rn3(Vgrash(R,L,hs));
 Vrh:=rn3(V-Vgh);
 Ggh:=rn2(Ygp*Vgh);
 Grh:=rn2(Yrp*Vrh);
 Go:=Ggh+Grh;
 if flk=0 then  Ky:=rn2(100*hs/hmax)
 else Ky:=rn2(100*Vgh/V);
 Rp:=(R-ht-np)/R1;
 if (abs(Rp)>1) then Rp:=1;
 alfa:=-rn2(arcsin(Rp)*180/Pi)+pal;

 with Sosudi.StringGrid1 do
 begin
  Cells[0, iy]:=floattostr(hs);
  Cells[1, iy]:=floattostr(Vgh);
  Cells[2, iy]:=floattostr(Vrh);
  Cells[3, iy]:=floattostr(Ggh);
  Cells[4, iy]:=floattostr(Grh);
  Cells[5, iy]:=floattostr(Go);
  Cells[6, iy]:=floattostr(Ky);
  Cells[7, iy]:=floattostr(alfa);
 end;
end;

{Кнопка расчет}
procedure TSosudi.Button1Click(Sender: TObject);
begin
flk:=ComboBox4.ItemIndex; //Считываем данные
R:=strtofloat(Edit1.Text);
L:=strtofloat(Edit2.Text);
P:=strtoint(ComboBox1.Text);
Pm:=strtoint(Combobox3.Text);
Nm:='Цистерна '+Combobox2.Text;
hmax:=0.02;
ht:=0.01;
h1:=strtofloat(JEdit1.Text);
alfa1:=strtoint(JEdit2.Text);
pal:=strtoint(JEdit3.Text);
np:=strtofloat(JEdit4.Text);

V:=Rn3(Pi*R*R*(2*R/3+L)); //Расчет общих
Vk:=rn3(V);
Ygp:=Yg(P);
Yrp:=Yr(P);
R1:=(R-h1-np)/cos(alfa1*Pi/180);
if flk=0 then Vgmp:=rn3(0.96*V*Yg(Pm)/Ygp) else Vgmp:=rn3(0.85*V);

Edit4.Text:=floattostr(V); //Вывод общих
Edit9.Text:=floattostr(Yrp);
Edit8.Text:=floattostr(Ygp);
Edit13.Text:=floattostr(Vgmp);


While (Vgrash(R,L,ht)<=Vgmp) do ht:=ht+0.001;
hmax:=rn3(ht); //Расчет hmax
if (flk=1) or (flk=2) then hmax:=2*R;

//Расширение пустой таблицы
StringGrid1.RowCount:=50+round(2*R/0.01);

ht:=0.01; //Расчет по высоте
iy:=1;
while (ht<=2*R) do
begin
Cikl(ht);
iy:=iy+1;

 if (ht<hmax)and ((ht+0.02)>=hmax)then //Точно при 100 %
 begin Cikl(hmax); iy:=iy+1; end;

 ht:=rn2(ht+0.01);
end;


pr:=2.5; //Расчет по процентно
while (pr<=120) do
begin
 Cikls(pr);
 iy:=iy+1;
 pr:=pr+2.5;
end;

end;

{Прорисовка формы при активации}
procedure TSosudi.FormActivate(Sender: TObject);
var
 r,c :integer;
begin
flk:=ComboBox4.ItemIndex;
with StringGrid1 do
begin
Cells[0, 0] :='h, м';
Cells[1, 0] :='Vж, м3';
Cells[2, 0] :='Vг, м3';
Cells[3, 0] :='Gж, кг';
Cells[4, 0] :='Gг, кг';
Cells[5, 0] :='Gобщ, кг';
Cells[6, 0] :='Ку, %';
Cells[7, 0] :='Alfa, град';
  for r := 1 to StringGrid1.RowCount-1 do
  for c := 0 to StringGrid1.ColCount-1 do
  begin
  StringGrid1.Cells[c,r] := '';
  end;

end;
end;

{О программе}
procedure TSosudi.N5Click(Sender: TObject);
begin
AboutBox.Showmodal
end;

{Выход}
procedure TSosudi.N1Click(Sender: TObject);
begin
Close;
end;

{Меню расчет}
procedure TSosudi.N3Click(Sender: TObject);
begin
Button1Click(Sender)
end;

{Сброс}
procedure TSosudi.N8Click(Sender: TObject);
begin
FormActivate(Sender)
end;



{Меню сохранить}
procedure TSosudi.N10Click(Sender: TObject);
begin
PF:='C:\' + Nm +'.doc';
PriceList;
end;

{Выбор из набора}
procedure TSosudi.ComboBox2Change(Sender: TObject);
begin
if (Combobox2.ItemIndex=0) then begin          //ЦЖУ-8
Edit1.Text:='0,6'; Edit2.Text:='6,69';
Combobox3.ItemIndex:=17; Combobox4.ItemIndex:=0;
end;
if (Combobox2.ItemIndex=1) then begin          //ЗБА-4
Edit1.Text:='0,7'; Edit2.Text:='4,195';
Combobox3.ItemIndex:=13; Combobox4.ItemIndex:=1;
end;
if (Combobox2.ItemIndex=2) then begin          //ППЦТ-22
Edit1.Text:='1,0'; Edit2.Text:='6,00';
Combobox3.ItemIndex:=15; Combobox4.ItemIndex:=2;
end;
if (Combobox2.ItemIndex=3) then begin          //СУГ-20
Edit1.Text:='1,0'; Edit2.Text:='5,70';
Combobox3.ItemIndex:=13; Combobox4.ItemIndex:=2;
end;
end;

{Меню сохранить как}
procedure TSosudi.N4Click(Sender: TObject);
begin
PF:='C:\' + Nm +'.doc';
if JvSaveDialog1.Execute then begin
PF:=JvSaveDialog1.FileName;
PriceList;
end;
end;

end.
