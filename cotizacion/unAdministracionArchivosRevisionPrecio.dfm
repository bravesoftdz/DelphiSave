inherited frmAdministracionArchivosRevisionPrecio: TfrmAdministracionArchivosRevisionPrecio
  Left = 531
  Top = 310
  Width = 616
  Height = 256
  Caption = 'Administraci'#243'n de Archivos de la Revisi'#243'n de Precio N'#186' '
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 608
  end
  inherited CoolBar: TCoolBar
    Width = 608
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 604
      end>
    inherited ToolBar: TToolBar
      Width = 591
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Archivo'
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 608
    Height = 155
    Columns = <
      item
        Expanded = False
        FieldName = 'AH_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VISIBILIDAD'
        Title.Caption = 'Visibilidad'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AH_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AH_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 106
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 80
    Width = 392
    Height = 128
    Caption = 'Agregar archivo'
    BorderStyle = bsDialog
    ActiveControl = edArchivo
    inherited BevelAbm: TBevel
      Top = 92
      Width = 384
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Archivo'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 44
      Width = 46
      Height = 13
      Caption = 'Visibilidad'
    end
    inherited btnAceptar: TButton
      Left = 235
      Top = 98
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 313
      Top = 98
      Width = 72
    end
    object edArchivo: TFilenameEdit
      Left = 64
      Top = 8
      Width = 320
      Height = 21
      NumGlyphs = 1
      TabOrder = 2
      Text = 'edArchivo'
    end
    object rgVisibilidad: TRadioGroup
      Left = 64
      Top = 32
      Width = 320
      Height = 32
      Columns = 2
      Items.Strings = (
        'P'#250'blico'
        'Privado')
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Left = 16
    Top = 124
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 124
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 152
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 152
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 180
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 96
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 96
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 180
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 96
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 124
  end
end
