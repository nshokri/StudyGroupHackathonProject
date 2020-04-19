<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UStudyGroup.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>U Student Groups</h1>
            </header>
    
            <section>
                <div class="description">
                    <ul>
                        <li>About us: We are a group of people.</li>
                        <li>Authors: Cameron Shokri, Nick Shokri, and Neema Shokri</li>
                    </ul>
                </div>
    
                <div>
                    <div class="info">
                        <ul>
                            <li><select name="states" id="states" onchange="stateChanged()">
                                <option value="state">Select State</option>
                            </select></li>
    
                            <li style="visibility: hidden" id="info2"><select id="schools">
                                <option value="school">Select School</option>
                            </select></li>
    
                            <li style="visibility: hidden"><select id="classes">
                                <option value="class">Select Class</option>
                            </select></li>
    
                            <li style="visibility: hidden"><button>Find</button></li>
    
                            <li style="visibility: hidden"><button>Create</button></li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>test</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="89px" />
    </form>
</body>
<script>
    var states = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Minor Outlying Islands", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "U.S. Virgin Islands", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"];
    var statesSelection = document.getElementById("states");

    for(var i = 0; i < states.length; i++)
    {
        var node = document.createElement("OPTION");
        var optionNode = document.createTextNode(states[i]);
        node.appendChild(optionNode);
        statesSelection.appendChild(node);
    }

    function stateChanged()
    {
        var stateSelected = document.getElementById("states").value;
        if(stateSelected != "Select State")
        {
            document.getElementById("info2").style.visibility = "visible";
        }
    }
</script>
</html>