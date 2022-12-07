using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void testingTextBox_Init(object sender, EventArgs e) {
        ASPxTextBox tb = sender as ASPxTextBox;
        string script = "function (s,e) { OnKeyDown(e.htmlEvent,s.GetInputElement(),s); }";
        if(((HttpCapabilitiesBase)(Request.Browser)).Browser == "Opera") 
            tb.ClientSideEvents.KeyPress = script;
        else
            tb.ClientSideEvents.KeyDown = script;
        
    }
}