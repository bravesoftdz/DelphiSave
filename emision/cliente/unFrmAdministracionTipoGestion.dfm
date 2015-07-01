inherited frmAdministracionTiposGestion: TfrmAdministracionTiposGestion
  Left = 179
  Top = 61
  Width = 639
  Height = 560
  Caption = 'Administraci'#243'n Tipos de Gesti'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 631
    Height = 2
  end
  inherited CoolBar: TCoolBar
    Top = 2
    Width = 631
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 627
      end>
    inherited ToolBar: TToolBar
      Width = 614
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
    end
  end
  inherited Grid: TArtDBGrid
    Top = 31
    Width = 631
    Height = 502
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'TG_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TG_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TG_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TG_FECHABAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 23
    Top = 47
    Width = 590
    Height = 472
    Caption = 'Administraci'#243'n Tipo Gesti'#243'n'
    BorderStyle = bsDialog
    DesignSize = (
      590
      472)
    inherited BevelAbm: TBevel
      Top = 436
      Width = 582
    end
    inherited btnAceptar: TButton
      Left = 432
      Top = 442
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 510
      Top = 442
      TabOrder = 3
    end
    inline fraTipoGestion: TfraTipoGestion
      Left = 0
      Top = 41
      Width = 590
      Height = 394
      Align = alTop
      TabOrder = 1
      DesignSize = (
        590
        394)
      inherited gbTiposContacto: TGroupBox
        Top = 249
        Width = 575
        Height = 144
        Anchors = [akLeft, akTop, akRight]
        inherited btnIncluirTextoTelefonico: TBitBtn
          OnClick = fraTipoGestionbtnIncluirTextoTelefonicoClick
        end
        inherited btnIncluirTextoFax: TBitBtn
          OnClick = fraTipoGestionbtnIncluirTextoFaxClick
        end
      end
    end
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 590
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        590
        41)
      object gbTipoGestion: TGroupBox
        Left = 7
        Top = 1
        Width = 575
        Height = 39
        Anchors = [akRight]
        Caption = 'Tipo de Gesti'#243'n'
        TabOrder = 0
        object lblDescripcion: TLabel
          Left = 43
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object edNombreTipoGestion: TEdit
          Left = 97
          Top = 12
          Width = 455
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 0
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      
        '       ITG.TG_ID, ITG.TG_DESCRIPCION, ITG.TG_USUALTA, ITG.TG_FEC' +
        'HAALTA,'
      '       ITG.TG_USUBAJA, ITG.TG_FECHABAJA'
      '  FROM EMI.ITG_TIPOGESTION ITG')
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
end
