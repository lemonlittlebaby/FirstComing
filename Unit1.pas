unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
const
  PER = 5;
var
  x, d, m, i: Integer;
  dUp, dDown, MAdd, MMinu : Integer;
  xUp, xDown, xAdd, xMinu : Integer;
  Arr : array[0..PER*PER - 1] of Integer;
begin
  Memo1.Clear;
  for i := 0 to Length(Arr) - 1 do
  begin
    Arr[i] := i + 1;
  end;

  for i := 0 to Length(Arr) - 1 do
  begin
    x := Arr[i];
    d := (x - 1) div PER;
    m := (x - 1) mod PER + 1;
    dUp := d;
    dDown := d;
    MAdd := m;
    MMinu := m;
    if d = 0 then //下边界
    begin
      dDown := PER;
    end
    else if d = PER - 1 then //上边界
    begin
      dUp := -1;
    end;
    if m = 1 then //左边界
    begin
      mMinu := PER + 1;
    end
    else if m = PER then //右边界
    begin
      mAdd := 0;
    end;
    x := d * PER + m;
    xUp := (dUp + 1) * PER + m;
    xDown := (dDown - 1) * PER + m;
    xAdd := d * PER + (mAdd + 1);
    xMinu := d * PER + (mMinu - 1);
    Memo1.Lines.Add(
      'x=' + IntToStr(x) + '; '
      + '上:' + IntToStr(xUp) + '; '
      + '下:' + IntToStr(xDown) + '; '
      + '左:' + IntToStr(xMinu) + '; '
      + '右:' + IntToStr(xAdd) + '; '
      );
  end;






end;

end.
