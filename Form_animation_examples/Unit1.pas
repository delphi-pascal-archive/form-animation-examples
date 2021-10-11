unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, XPMan, Buttons, ToolWin, ComCtrls,
  jpeg;

type
  TForm1 = class(TForm)
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button7: TButton;
    Button6: TButton;
    Button5: TButton;
    Label1: TLabel;
    Image1: TImage;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
  private
   tray:boolean;

  public
    direction:integer;
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, frmclock, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Hide;
  AnimateWindow(Form2.Handle, 2000, AW_CENTER);

  Form2.show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form2.Hide;
  AnimateWindow(Form2.Handle, 2000, AW_HOR_POSITIVE);

  Form2.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2.Hide;
  AnimateWindow(Form2.Handle, 2000, AW_HOR_NEGATIVE);

  Form2.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form2.Hide;
  AnimateWindow(Form2.Handle, 2000, AW_VER_POSITIVE);

  Form2.show;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//renders form transparent/visible
  form1.TransparentColor := not (form1.TransparentColor);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
//first hide the form
  Form2.Hide;
//animate it
  AnimateWindow(Form2.Handle, 2000, AW_BLEND);
//then show it
  Form2.show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form2.Hide;
  AnimateWindow(Form2.Handle, 2000, AW_VER_NEGATIVE);

  Form2.show;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Form2.Hide;
  AnimateWindow(Form2.Handle, 2000, AW_CENTER);

  Form2.show;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
//exit program
  close;
end;

procedure TForm1.Button9Click(Sender: TObject);
var x: integer;
begin
direction:=0;
//pop up alert
//fast
  form3.Hide;
//workarea =  desktop - taskbar -toolbar etc
  form3.Left := screen.WorkAreaWidth - form3.Width;
  form3.Top := screen.WorkAreaHeight;
  form3.Show;
  form1.SetFocus;
  for x := 0 to form3.Height do begin
//Interrupts the execution of an application so that it can process the message queue.
    application.ProcessMessages;

    form3.Top := screen.WorkAreaHeight - x;
  end; end;

procedure TForm1.Button10Click(Sender: TObject);
var x: integer;
begin
direction:=0;
  form3.Hide;
  form3.Left := screen.WorkAreaWidth - form3.Width;
  form3.Top := screen.WorkAreaHeight;
  form3.Show;
  form1.SetFocus;
  for x := 0 to form3.Height do begin
//same as previous but slower
// The Sleep function suspends the execution of the current thread for a specified interval.
    sleep(1);
    application.ProcessMessages;

    form3.Top := screen.WorkAreaHeight - x;
  end;

end;

procedure TForm1.Button11Click(Sender: TObject);
//draw text on desktop
var
  Handle: HWND;
  Dc: HDC;
  ACanvas: TCanvas;
begin
  Handle := GetDesktopWindow;
  Dc := GetWindowDC(Handle);
  ACanvas := TCanvas.Create;
  try
    ACanvas.Handle := DC;
    BeginPath(ACanvas.Handle);
    ACanvas.Font.Color := clblue;
    ACanvas.Font.Name := 'Tahoma';
    ACanvas.Font.Size := 30;
    SetBkMode(ACanvas.Handle, TRANSPARENT);
    EndPath(ACanvas.Handle);
//draw text at random positions
    ACanvas.TextOut(random(800), random(600), 'WWW.DELCODE.COM');
  finally

    ReleaseDC(Handle, ACanvas.Handle);
    ACanvas.Free;
  end;
end;


procedure TForm1.Button12Click(Sender: TObject);
begin
//show clock
  fmainclock.Show;
end;

procedure TForm1.Button13Click(Sender: TObject);

var
  HTaskbar: HWND;
begin
  //Find handle of TASKBAR
  HTaskBar := FindWindow('Shell_TrayWnd', nil);
   //Enable the taskbar
  EnableWindow(HTaskBar, True);
  //Show the taskbar
  ShowWindow(HTaskbar, SW_SHOW);
  form4.show;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  HTaskbar: HWND;
begin
  //Find handle of TASKBAR
  HTaskBar := FindWindow('Shell_TrayWnd', nil);
   //Enable the taskbar
  EnableWindow(HTaskBar, true);
  //Show the taskbar
  if tray then begin
  ShowWindow(HTaskbar, 0);
  tray:=false end else begin
  ShowWindow(HTaskbar, 1);
  tray:=true end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
tray:=true;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm1.Button16Click(Sender: TObject);
var x: integer;
begin
direction:=1;
  form3.Hide;
  form3.Left := screen.WorkAreaLeft;
  form3.Top := screen.WorkAreaHeight;
  form3.Show;
  form1.SetFocus;
  for x := 0 to form3.Height do begin
//same as previous but slower
// The Sleep function suspends the execution of the current thread for a specified interval.
    sleep(1);
    application.ProcessMessages;

    form3.Top := screen.WorkAreaHeight - x;
  end;
 end;
procedure TForm1.Button17Click(Sender: TObject);
var x: integer;
begin
  direction:=2;
  form3.Hide;
  form3.Left := screen.WorkAreaLeft ;
  form3.Top := screen.WorkAreaHeight;
  form3.Show;
  form1.SetFocus;
  for x := 0 to form3.Height do begin
//same as previous but slower
// The Sleep function suspends the execution of the current thread for a specified interval.
    sleep(1);
    application.ProcessMessages;

    form3.top := screen.WorkAreaTop -form3.height +x;
  end;
end;

procedure TForm1.Button18Click(Sender: TObject);
var x: integer;
begin
  direction:=3;
  form3.Hide;
  form3.Left := screen.WorkAreawidth -form3.Width ;
  form3.Top := screen.WorkAreaHeight;
  form3.Show;
  form1.SetFocus;
  for x := 0 to form3.Height do begin
//same as previous but slower
// The Sleep function suspends the execution of the current thread for a specified interval.
    sleep(1);
    application.ProcessMessages;

    form3.top := screen.WorkAreaTop -form3.height +x;
end;
    end;
procedure TForm1.Button19Click(Sender: TObject);
var oldtop,oldleft,x:integer;

begin
oldtop:=top;
oldleft:=left;
for x:= 1 to 50 do begin
top:= top+(random(6)-3);
left:=left+(random(6)-3);
application.ProcessMessages;
sleep(2);
top:=oldtop;
left:=oldleft;
end;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
form6.show;
end;

end.
