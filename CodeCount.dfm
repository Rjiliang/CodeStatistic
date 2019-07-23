object Form1: TForm1
  Left = 635
  Top = 170
  Width = 488
  Height = 544
  Caption = #20195#30721#37327#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 80
    Width = 10
    Height = 13
    Caption = 'ss'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 472
    Height = 464
    Align = alClient
    TabOrder = 0
  end
  object Button1: TButton
    Left = 368
    Top = 448
    Width = 75
    Height = 25
    Caption = #32479#35745
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 89
    Width = 409
    Height = 168
    Caption = 'SVN'#39033#30446#20195#30721#36335#24452
    TabOrder = 2
    object svnProjectList: TMemo
      Left = 8
      Top = 24
      Width = 393
      Height = 137
      Hint = #35831#36755#20837#39033#30446#26412#22320#23384#20648#30340#36335#24452#65292#22810#20010#39033#30446#20043#38388#35831#29992#25442#34892
      Lines.Strings = (
        'svnProjectList')
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 272
    Width = 409
    Height = 161
    Caption = 'GIT'#39033#30446#20195#30721#36335#24452
    TabOrder = 3
    object GitProjectList: TMemo
      Left = 8
      Top = 24
      Width = 393
      Height = 129
      Hint = #35831#36755#20837#39033#30446#26412#22320#23384#20648#30340#36335#24452#65292#22810#20010#39033#30446#20043#38388#35831#25442#34892
      Lines.Strings = (
        'GitProjectList')
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 41
    Align = alTop
    TabOrder = 4
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 60
      Height = 13
      Caption = #24320#22987#26102#38388#65306
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 248
      Top = 18
      Width = 60
      Height = 13
      Caption = #32467#26463#26102#38388#65306
    end
    object beginTime: TDateTimePicker
      Left = 104
      Top = 14
      Width = 113
      Height = 21
      Date = 43024.715621319450000000
      Time = 43024.715621319450000000
      TabOrder = 0
    end
    object endTime: TDateTimePicker
      Left = 320
      Top = 14
      Width = 113
      Height = 21
      Date = 43024.715798182870000000
      Time = 43024.715798182870000000
      TabOrder = 1
    end
  end
  object isCheckOutCode: TCheckBox
    Left = 32
    Top = 56
    Width = 153
    Height = 17
    Caption = #32479#35745#21069#26159#21542#26356#26032#20195#30721
    TabOrder = 5
  end
end
