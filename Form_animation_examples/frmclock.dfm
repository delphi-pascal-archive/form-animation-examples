object fmainClock: TfmainClock
  Left = 216
  Top = 362
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Form that'#39's going to be rounded'
  ClientHeight = 156
  ClientWidth = 458
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 56
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 176
    Top = 32
    object CloseClockroundform1: TMenuItem
      Caption = 'Close Clock (round form)'
      OnClick = CloseClockroundform1Click
    end
  end
end
