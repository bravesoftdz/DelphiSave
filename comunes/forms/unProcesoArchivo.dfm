inherited frmProcesoArchivo: TfrmProcesoArchivo
  Left = 601
  Top = 291
  Width = 999
  Height = 557
  Caption = 'Procesos Archivos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 991
    Height = 145
    object pcFiltrosBusqueda: TPageControl
      Left = 0
      Top = 0
      Width = 991
      Height = 145
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        object lbTipoArchivoFiltro: TLabel
          Left = 8
          Top = 9
          Width = 63
          Height = 13
          Caption = 'Tipo Archivo:'
        end
        object lbProcesoFiltro: TLabel
          Left = 8
          Top = 33
          Width = 42
          Height = 13
          Caption = 'Proceso:'
        end
        object lbCodigoErrorFiltro: TLabel
          Left = 8
          Top = 57
          Width = 61
          Height = 13
          Caption = 'Codigo Error:'
        end
        object cbResueltoFiltro: TCheckBox
          Left = 10
          Top = 80
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Resuelto'
          TabOrder = 0
        end
        object cbSinResolverFiltro: TCheckBox
          Left = 154
          Top = 80
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Sin Resolver'
          TabOrder = 1
        end
        inline fraTipoArchivoFiltro: TfraCodigoDescripcion
          Left = 92
          Top = 1
          Width = 357
          Height = 23
          TabOrder = 2
        end
        inline fraProcesoFiltro: TfraCodigoDescripcion
          Left = 92
          Top = 27
          Width = 357
          Height = 23
          TabOrder = 3
        end
        inline fraCodigoErrorFiltro: TfraCodigoDescripcion
          Left = 92
          Top = 52
          Width = 357
          Height = 23
          TabOrder = 4
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 145
    Width = 991
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 987
      end>
    inherited ToolBar: TToolBar
      Width = 974
    end
  end
  inherited Grid: TArtDBGrid
    Top = 174
    Width = 991
    Height = 356
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
end
