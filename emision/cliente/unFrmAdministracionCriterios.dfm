object frmAdministracionCriterio: TfrmAdministracionCriterio
  Left = 192
  Top = 132
  Width = 696
  Height = 480
  Caption = 'Administraci'#243'n de Criterios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fraAdministracionCriterios: TfraCriterios
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    TabOrder = 0
    inherited cbCriterios: TCoolBar
      Width = 688
      Bands = <
        item
          Control = fraAdministracionCriterios.tbComandosCriterios
          ImageIndex = -1
          MinHeight = 26
          Width = 684
        end>
      inherited tbComandosCriterios: TToolBar
        Width = 671
      end
    end
    inherited dbgCriterios: TArtDBGrid
      Width = 688
      Height = 424
      Columns = <
        item
          Expanded = False
          FieldName = 'CA_DESCRIPCION'
          Title.Caption = 'Criterio'
          Width = 670
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CA_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CA_USUALTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CA_FECHAALTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CA_USUBAJA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CA_FECHABAJA'
          Visible = False
        end>
    end
    inherited fpCriterios: TFormPanel
      Left = 83
      Top = 56
      inherited cbReglasparaVariables: TCoolBar
        Bands = <
          item
            Control = fraAdministracionCriterios.tbReglasVariables
            ImageIndex = -1
            MinHeight = 26
            Width = 486
          end>
        inherited tbReglasVariables: TToolBar
          inherited tbNuevaReglaVariable: TToolButton
            OnClick = fraAdministracionCriteriostbNuevaReglaVariableClick
          end
          inherited tbEditarReglaParaVariable: TToolButton
            OnClick = fraAdministracionCriteriostbEditarReglaParaVariableClick
          end
          inherited tbEliminarReglaParaVariable: TToolButton
            OnClick = fraAdministracionCriteriostbEliminarReglaParaVariableClick
          end
        end
      end
      inherited gbEdicionReglaVariables: TGroupBox
        inherited AceptarReglaDeVariable: TSpeedButton
          OnClick = fraAdministracionCriteriosAceptarReglaDeVariableClick
        end
      end
      inherited dbgReglasParaVariables: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'VA_NOMBRE'
            Title.Caption = 'Nombre'
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERADOR'
            Title.Caption = 'Operador'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RC_VALORUNARIO'
            Title.Caption = 'V.Unario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RC_VALORBINARIO'
            Title.Caption = 'V.Binario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RELACION'
            Title.Caption = 'Relaci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RC_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'RC_IDCRITERIOLOTE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'RC_IDVARIABLE'
            Visible = False
          end>
      end
    end
    inherited sdqRelacion: TSDQuery
      Left = 310
    end
    inherited dsRelacion: TDataSource
      Left = 312
    end
  end
end
