object Sosudi: TSosudi
  Left = 252
  Top = 139
  Width = 550
  Height = 471
  Caption = 'Поинтервальная калибровка сосуда для сжиженого газа V 1.22'
  Color = clBtnFace
  Constraints.MaxWidth = 550
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 281
    Width = 542
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 286
    Width = 542
    Height = 139
    Align = alClient
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 540
      Height = 137
      Align = alClient
      ColCount = 8
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 55
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 281
    Align = alTop
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 48
      Width = 305
      Height = 217
      Caption = 'Ввод данных'
      TabOrder = 0
      object Label1: TLabel
        Left = 33
        Top = 28
        Width = 22
        Height = 13
        Caption = 'R, м'
      end
      object Label2: TLabel
        Left = 33
        Top = 60
        Width = 20
        Height = 13
        Caption = 'L, м'
      end
      object Label7: TLabel
        Left = 21
        Top = 125
        Width = 55
        Height = 13
        Caption = 'P, кгс/см2'
      end
      object Label3: TLabel
        Left = 14
        Top = 92
        Width = 77
        Height = 13
        Caption = 'P max, кгс/см2'
      end
      object Label5: TLabel
        Left = 169
        Top = 28
        Width = 39
        Height = 13
        Caption = 'при h1='
      end
      object Label6: TLabel
        Left = 177
        Top = 60
        Width = 29
        Height = 13
        Caption = 'alfa1='
      end
      object Label10: TLabel
        Left = 281
        Top = 28
        Width = 11
        Height = 13
        Caption = 'м,'
      end
      object Label11: TLabel
        Left = 265
        Top = 60
        Width = 23
        Height = 13
        Caption = 'град'
      end
      object Label12: TLabel
        Left = 161
        Top = 92
        Width = 48
        Height = 13
        Caption = 'поправка'
      end
      object Label14: TLabel
        Left = 265
        Top = 92
        Width = 23
        Height = 13
        Caption = 'град'
      end
      object Label15: TLabel
        Left = 281
        Top = 124
        Width = 11
        Height = 13
        Caption = 'м,'
      end
      object Label16: TLabel
        Left = 153
        Top = 124
        Width = 56
        Height = 13
        Caption = 'недопогр-е'
      end
      object ComboBox1: TComboBox
        Left = 104
        Top = 120
        Width = 49
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = '8'
        Items.Strings = (
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25')
      end
      object ComboBox3: TComboBox
        Left = 104
        Top = 88
        Width = 49
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = '8'
        Items.Strings = (
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25')
      end
      object Edit2: TJvSpinEdit
        Left = 104
        Top = 56
        Width = 57
        Height = 21
        Decimal = 3
        Increment = 0.001
        MaxValue = 200
        ValueType = vtFloat
        Value = 6
        MaxLength = 4
        TabOrder = 2
      end
      object JEdit1: TJvSpinEdit
        Left = 216
        Top = 24
        Width = 57
        Height = 21
        Decimal = 3
        Increment = 0.001
        MaxValue = 200
        ValueType = vtFloat
        Value = 0.14
        MaxLength = 4
        TabOrder = 3
      end
      object JEdit2: TJvSpinEdit
        Left = 216
        Top = 56
        Width = 41
        Height = 21
        MaxValue = 200
        Value = 20
        MaxLength = 3
        TabOrder = 4
      end
      object JEdit3: TJvSpinEdit
        Left = 216
        Top = 88
        Width = 41
        Height = 21
        MaxValue = 360
        MinValue = -360
        Value = 90
        MaxLength = 3
        TabOrder = 5
      end
      object JEdit4: TJvSpinEdit
        Left = 216
        Top = 120
        Width = 57
        Height = 21
        Decimal = 3
        Increment = 0.001
        MaxValue = 200
        ValueType = vtFloat
        Value = 0.14
        MaxLength = 4
        TabOrder = 6
      end
    end
    object Button1: TButton
      Left = 102
      Top = 216
      Width = 83
      Height = 25
      Caption = '-->'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox2: TGroupBox
      Left = 328
      Top = 48
      Width = 193
      Height = 217
      Caption = 'Результат'
      TabOrder = 2
      object Label4: TLabel
        Left = 36
        Top = 28
        Width = 27
        Height = 13
        Caption = 'V, м3'
      end
      object Label8: TLabel
        Left = 25
        Top = 93
        Width = 51
        Height = 13
        Caption = 'Yж, кг/м3'
      end
      object Label9: TLabel
        Left = 26
        Top = 125
        Width = 48
        Height = 13
        Caption = 'Yг, кг/м3'
      end
      object Label13: TLabel
        Left = 23
        Top = 62
        Width = 57
        Height = 13
        Caption = 'Vж max, м3'
      end
      object Edit4: TEdit
        Left = 104
        Top = 24
        Width = 57
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = 'Non'
      end
      object Edit8: TEdit
        Left = 104
        Top = 88
        Width = 57
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = 'Non'
      end
      object Edit9: TEdit
        Left = 104
        Top = 120
        Width = 57
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = 'Non'
      end
      object Edit13: TEdit
        Left = 104
        Top = 56
        Width = 57
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = 'Non'
      end
    end
    object ComboBox4: TComboBox
      Left = 144
      Top = 24
      Width = 169
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'Среда'
      Items.Strings = (
        'Углекислота'
        'Аммиак'
        'Пропан')
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 24
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'Цистерна'
      OnChange = ComboBox2Change
      Items.Strings = (
        'ЦЖУ - 8,0 - 1,8'
        'ЗБА - 4'
        'ППЦТ - 22'
        'СУГ - 20')
    end
    object Edit1: TJvSpinEdit
      Left = 112
      Top = 72
      Width = 49
      Height = 21
      Increment = 0.01
      MaxValue = 200
      ValueType = vtFloat
      Value = 0.6
      MaxLength = 3
      TabOrder = 5
    end
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    Left = 248
    Top = 65528
    object qwe1: TMenuItem
      Caption = '&Файл'
      object N10: TMenuItem
        Caption = '&Сохранить'
        OnClick = N10Click
      end
      object N4: TMenuItem
        Caption = 'Сохранить как...'
        OnClick = N4Click
      end
      object N1: TMenuItem
        Caption = '&Выход'
        OnClick = N1Click
      end
    end
    object N2: TMenuItem
      Caption = '&Команды'
      object N3: TMenuItem
        Caption = '&Подсчитать'
        OnClick = N3Click
      end
      object N8: TMenuItem
        Caption = '&Сброс'
        OnClick = N8Click
      end
    end
    object N7: TMenuItem
      Caption = '&Справка'
      object N5: TMenuItem
        Caption = '&О программе'
        OnClick = N5Click
      end
    end
  end
  object JvSaveDialog1: TJvSaveDialog
    Filter = 'Документы Word|**.doc'
    Height = 0
    Width = 0
    Left = 216
    Top = 65528
  end
end
