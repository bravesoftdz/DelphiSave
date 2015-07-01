inherited frmHistoricoCheques: TfrmHistoricoCheques
  Left = 148
  Top = 166
  Width = 550
  Height = 350
  Caption = 'Hist'#243'rico de Cheques'
  Constraints.MinHeight = 350
  Constraints.MinWidth = 550
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 542
    Height = 8
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 8
    Width = 542
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 538
      end>
    inherited ToolBar: TToolBar
      Width = 525
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
    Top = 37
    Width = 542
    Height = 286
    Columns = <
      item
        Expanded = False
        FieldName = 'SITUACION'
        Title.Caption = 'Situaci'#243'n'
        Width = 206
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_SITUACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Situaci'#243'n'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CARGASITUACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga Situaci'#243'n'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Usuario'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROLISTADODELEGACION'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Listado Cheques a Deleg.'
        Width = 151
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADEBITADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Debitado'
        Width = 70
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_DESCRIPCION SITUACION, HE_FECHASITUACION FECHA_SITUACI' +
        'ON, SE_NOMBRE USUARIO'
      
        '  FROM ART.USE_USUARIOS, ART.CTB_TABLAS, RHE_HISTORICOESTADOCHEQ' +
        'UE'
      ' WHERE HE_SITUACION = TB_CODIGO'
      '   AND TB_CLAVE = '#39'SITCH'#39
      '   AND HE_USUSITUACION = SE_USUARIO'
      '   AND 1 = 2')
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
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16466
        LinkControl = tbEliminar
      end>
    Left = 132
    Top = 200
  end
end
