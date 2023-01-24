<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var prefix = '';
        function OnKeyDown(event, input, s) {
            var keyCode = event.keyCode || event.which;
            if (keyCode != 8) { //Backspace
                if (keyCode >= 37 && keyCode <= 40 || keyCode == 35 || keyCode == 36) { //Keyarrows, Home, End
                    return;
                }
                if (getCaretPos(input) < prefix.length)
                    ASPxClientUtils.PreventEventAndBubble(event);
            }
            else {
                if (getCaretPos(input) > prefix.length)
                    return;
                else
                    ASPxClientUtils.PreventEventAndBubble(event);
            }
        }

        function getCaretPos(input) {
            if (document.selection && document.selection.createRange) {
                var range = document.selection.createRange();
                var bookmark = range.getBookmark();
                var caret_pos = bookmark.charCodeAt(2) - 2;
            }
            else {
                if (input.setSelectionRange)
                    var caret_pos = input.selectionStart;
            }
            return caret_pos;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Testing TextBox
                </td>
                <td>
                    <dx:ASPxTextBox ID="testingTextBox" runat="server" Width="170px" AutoPostBack="false"
                        OnInit="testingTextBox_Init" ClientInstanceName="tb">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Set prefix in this TextBox
                </td>
                <td>
                    <dx:ASPxTextBox ID="prefixTextBox" runat="server" Width="170px">
                        <ClientSideEvents Init="function (s,e) { s.SetText('Set prefix'); }" GotFocus="function (s,e) { s.SetText(''); }"
                            KeyUp="function (s,e) { prefix = s.GetText(); tb.SetText(prefix); }" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
