//this is the alert /popup form
unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.Label1MouseEnter(Sender: TObject);
begin
//when mouse pointer is over caption, make the text bold and underlined
  label1.Font.Style := [fsbold, fsunderline];

end;

procedure TForm3.Label1MouseLeave(Sender: TObject);
begin
// when mouse is not over caption, remove underline
  label1.Font.Style := [fsbold];
end;

procedure TForm3.Label1Click(Sender: TObject);
var x: integer;
begin
  case form1.direction of
  0:begin
  form1.setfocus;
 form3.Left := screen.WorkAreaWidth - form3.Width;
  form3.Top := screen.WorkAreaHeight-form3.Height;
  for x := Height downto 0 do begin
    sleep(1);
    application.ProcessMessages;

    Top := Top + 1;
  end;
  form3.Hide;end;
  1:begin
  form1.setfocus;
  Left := screen.WorkAreaLeft ;
  Top := screen.WorkAreaHeight - height;

  for x := Height downto 0 do begin
    sleep(1);
    application.ProcessMessages;

    Top := Top + 1;
  end;
  form3.Hide;end;
   2:begin
  form1.setfocus;
  Left := screen.WorkAreaLeft ;
 form3.top := screen.WorkAreaTop;

  for x := Height downto 0 do begin
    sleep(1);
    application.ProcessMessages;

    Top := Top - 1;
  end;
  form3.Hide;end;
   3:begin
  form1.setfocus;
 form3.Left := screen.workareawidth-form3.Width  ;
  form3.Top := screen.WorkAreatop;

  for x := Height downto 0 do begin
    sleep(1);
    application.ProcessMessages;
top:=top-1;
  end;
  form3.Hide;end;
  end;
  end;
end.
