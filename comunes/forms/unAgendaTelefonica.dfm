inherited frmAgendaTelefonica: TfrmAgendaTelefonica
  Left = 234
  Top = 137
  Width = 600
  Height = 355
  ActiveControl = edNombre
  Caption = 'Agenda Telef'#243'nica'
  Constraints.MinHeight = 160
  Constraints.MinWidth = 344
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 52
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 200
      Height = 44
      Caption = ' Nombre o Apellido '
      TabOrder = 0
      DesignSize = (
        200
        44)
      object edNombre: TEdit
        Left = 12
        Top = 16
        Width = 176
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = 'EDIT1'
        OnKeyDown = ActualizoPorEnter
      end
    end
    object GroupBox2: TGroupBox
      Left = 208
      Top = 4
      Width = 380
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Sector o Gerencia '
      TabOrder = 1
      DesignSize = (
        380
        44)
      object edSector: TEdit
        Left = 12
        Top = 16
        Width = 356
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = 'EDIT1'
        OnKeyDown = ActualizoPorEnter
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 52
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 81
    Width = 592
    Height = 247
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GERENCIA'
        Title.Caption = 'Gerencia'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_INTERNO'
        Title.Caption = 'Interno'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_MAIL'
        Title.Caption = 'Correo electr'#243'nico'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_PISO'
        Title.Caption = 'Piso'
        Width = 35
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    Top = 140
  end
  inherited dsConsulta: TDataSource
    Top = 140
  end
  inherited SortDialog: TSortDialog
    Top = 168
  end
  inherited ExportDialog: TExportDialog
    Top = 168
  end
  inherited QueryPrint: TQueryPrint
    Top = 196
  end
  inherited Seguridad: TSeguridad
    Top = 112
  end
  inherited FormStorage: TFormStorage
    Top = 112
  end
  inherited PrintDialog: TPrintDialog
    Top = 196
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end>
    Top = 112
  end
  inherited FieldHider: TFieldHider
    Top = 140
  end
end
