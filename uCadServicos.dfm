object frmCadServicos: TfrmCadServicos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Servi'#231'os'
  ClientHeight = 386
  ClientWidth = 637
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
  object grbServicos: TGroupBox
    Left = 5
    Top = 3
    Width = 626
    Height = 238
    Caption = ' Servi'#231'os '
    TabOrder = 0
    object dbgServicos: TDBGrid
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
      OnCellClick = dbgServicosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Servi'#231'o'
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C'#243'digo'
          Width = 298
          Visible = True
        end>
    end
  end
  object dbnServicos: TDBNavigator
    Left = 481
    Top = 353
    Width = 148
    Height = 25
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 1
    OnClick = dbnServicosClick
  end
  object btnInserir: TButton
    Left = 8
    Top = 353
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
    Top = 353
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
    Top = 353
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
  object grbDados: TGroupBox
    Left = 8
    Top = 245
    Width = 621
    Height = 103
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 69
      Width = 40
      Height = 18
      Caption = 'Sevi'#231'o'
    end
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 43
      Height = 18
      Caption = 'C'#243'digo'
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
    object edtServico: TEdit
      Left = 63
      Top = 66
      Width = 494
      Height = 26
      MaxLength = 150
      TabOrder = 2
    end
    object edtCodigo: TEdit
      Left = 63
      Top = 35
      Width = 494
      Height = 26
      MaxLength = 50
      TabOrder = 1
    end
  end
  object btnGravar: TButton
    Left = 276
    Top = 353
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Gravar'
    DisabledImageIndex = 9
    ImageIndex = 8
    Images = frmPrincipal.ImageList1
    TabOrder = 6
    OnClick = btnGravarClick
  end
  object btnDesfazer: TButton
    Left = 365
    Top = 354
    Width = 84
    Height = 25
    Cursor = crHandPoint
    Caption = 'Desfazer'
    DisabledImageIndex = 7
    ImageIndex = 6
    Images = frmPrincipal.ImageList1
    TabOrder = 7
    OnClick = btnDesfazerClick
  end
end
