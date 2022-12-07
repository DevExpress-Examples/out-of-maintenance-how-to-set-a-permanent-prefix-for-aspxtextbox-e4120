Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.Configuration
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub testingTextBox_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim tb As ASPxTextBox = TryCast(sender, ASPxTextBox)
		Dim script As String = "function (s,e) { OnKeyDown(e.htmlEvent,s.GetInputElement(),s); }"
		If (CType(Request.Browser, HttpCapabilitiesBase)).Browser = "Opera" Then
			tb.ClientSideEvents.KeyPress = script
		Else
			tb.ClientSideEvents.KeyDown = script
		End If

	End Sub
End Class