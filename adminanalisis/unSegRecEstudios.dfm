inherited frmSegRecEstudios: TfrmSegRecEstudios
  Left = 222
  Top = 173
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frmSegRecEstudios'
  ClientHeight = 343
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    inherited ToolBar: TToolBar
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 16
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 19
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Height = 309
    Columns = <
      item
        Expanded = False
        FieldName = 'RS_ESTUDIO'
        Title.Caption = 'Cod.Estudio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Desc.Estudio'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 92
    Width = 353
    Height = 77
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 41
      Width = 345
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    inherited btnAceptar: TButton
      Left = 195
      Top = 47
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 273
      Top = 47
      TabOrder = 2
    end
    inline fraReconfirmacion: TfraReconfirmacion
      Left = 52
      Top = 8
      Width = 297
      Height = 22
      TabOrder = 0
      inherited cmbEstudio: TArtComboBox
        Width = 229
      end
    end
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
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
  end
end
