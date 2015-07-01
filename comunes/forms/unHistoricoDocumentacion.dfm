inherited frmHistoricoDocumentacion: TfrmHistoricoDocumentacion
  Caption = 'Hist'#243'rico de Documentaci'#243'n'
  ClientHeight = 370
  ClientWidth = 655
  Constraints.MinHeight = 400
  Constraints.MinWidth = 663
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 663
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 655
    Height = 5
    Visible = False
    ExplicitWidth = 655
    ExplicitHeight = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 655
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 649
      end>
    ExplicitTop = 5
    ExplicitWidth = 655
    inherited ToolBar: TToolBar
      Left = 11
      Width = 640
      ExplicitLeft = 11
      ExplicitWidth = 640
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 655
    Height = 336
    Columns = <
      item
        Expanded = False
        FieldName = 'HD_ID'
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_REC'
        Title.Caption = 'Usuario Recepci'#243'n'
        Width = 137
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HD_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_DER'
        Title.Caption = 'Derivado A'
        Width = 156
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADERIVACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Derivaci'#243'n'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_ALTA'
        Title.Caption = 'Usuario Movimiento'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HD_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Movimiento'
        Width = 123
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT HD_ID, USE_DER.SE_NOMBRE USE_DER, TRUNC(HD_FECHADERIVACIO' +
        'N) FECHADERIVACION,'
      
        '       HD_FECHARECEPCION, USE_REC.SE_NOMBRE USE_REC, USE_ALTA.SE' +
        '_NOMBRE USE_ALTA,'
      '       HD_FECHAALTA, HD_USUALTA'
      
        '  FROM USE_USUARIOS USE_ALTA, USE_USUARIOS USE_DER, USE_USUARIOS' +
        ' USE_REC, COMUNES.CHD_HISTORICODOCUMENTCRECIBIDA'
      ' WHERE HD_IDDOCUMENTACIONRECIBIDA = :IdDocRecibida'
      '   AND HD_DERIVADOA = USE_DER.SE_USUARIO(+)'
      '   AND HD_USURECEPCION = USE_REC.SE_USUARIO(+)'
      '   AND HD_USUALTA = USE_ALTA.SE_USUARIO(+)'
      '   AND 1 = 2'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdDocRecibida'
        ParamType = ptInput
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 110
    Top = 200
  end
end
