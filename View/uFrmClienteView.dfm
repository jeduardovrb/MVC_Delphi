object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 331
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 33
    Top = 38
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label1: TLabel
    Left = 33
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edtNome: TEdit
    Left = 72
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 130
    Width = 545
    Height = 193
    DataSource = dsClientes
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = DBGrid1KeyUp
    OnMouseUp = DBGrid1MouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 134
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edtCodigo: TEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 215
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 53
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 6
    OnClick = Button4Click
  end
  object mmTableClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 440
    Top = 16
    object mmTableClientesCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object mmTableClientesNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NOME'
    end
  end
  object dsClientes: TDataSource
    DataSet = mmTableClientes
    Left = 528
    Top = 16
  end
end
