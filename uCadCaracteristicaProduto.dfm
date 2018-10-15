object frmCadCaracteristicaProduto: TfrmCadCaracteristicaProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Caracter'#237'sticas  para o Produto'
  ClientHeight = 362
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object grbCaracteristica: TGroupBox
    Left = 5
    Top = 3
    Width = 626
    Height = 238
    Caption = ' Caracteristica para o Produto '
    TabOrder = 0
    object dbgCaracteristica: TDBGrid
      Left = 2
      Top = 20
      Width = 622
      Height = 216
      Align = alClient
      DrawingStyle = gdsGradient
      FixedColor = clBackground
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBackground
      TitleFont.Height = -15
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
      OnCellClick = dbgCaracteristicaCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Peso'
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Altura'
          Width = 298
          Visible = True
        end>
    end
  end
  object grbDados: TGroupBox
    Left = 8
    Top = 245
    Width = 621
    Height = 76
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 37
      Width = 30
      Height = 18
      Caption = 'Peso'
    end
    object Label2: TLabel
      Left = 304
      Top = 37
      Width = 38
      Height = 18
      Caption = 'Altura'
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 12
      Height = 18
      Caption = 'Id'
    end
    object edtID: TEdit
      Left = 63
      Top = 5
      Width = 121
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object edtPeso: TEdit
      Left = 63
      Top = 34
      Width = 200
      Height = 26
      TabOrder = 1
    end
    object edtAltura: TEdit
      Left = 359
      Top = 34
      Width = 200
      Height = 26
      TabOrder = 2
    end
  end
  object btnInserir: TButton
    Left = 8
    Top = 329
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Inserir'
    DisabledImageIndex = 1
    ImageIndex = 0
    Images = frmPrincipal.ImageList1
    TabOrder = 2
    OnClick = btnInserirClick
  end
  object btnEditar: TButton
    Left = 97
    Top = 329
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Editar'
    DisabledImageIndex = 5
    ImageIndex = 4
    Images = frmPrincipal.ImageList1
    TabOrder = 3
    OnClick = btnEditarClick
  end
  object btnDeletar: TButton
    Left = 187
    Top = 329
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Deletar'
    DisabledImageIndex = 3
    ImageIndex = 2
    Images = frmPrincipal.ImageList1
    TabOrder = 4
    OnClick = btnDeletarClick
  end
  object btnGravar: TButton
    Left = 276
    Top = 329
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Gravar'
    DisabledImageIndex = 9
    ImageIndex = 8
    Images = frmPrincipal.ImageList1
    TabOrder = 5
    OnClick = btnGravarClick
  end
  object btnDesfazer: TButton
    Left = 365
    Top = 330
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Desfazer'
    DisabledImageIndex = 7
    ImageIndex = 6
    Images = frmPrincipal.ImageList1
    TabOrder = 6
    OnClick = btnDesfazerClick
  end
  object dbnCaracteristica: TDBNavigator
    Left = 481
    Top = 329
    Width = 148
    Height = 25
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 7
    OnClick = dbnCaracteristicaClick
  end
end
