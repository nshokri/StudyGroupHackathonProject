﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="UStudent.WebForm1" %>

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
                            <li><select id="states">
                                <option value="state">Select State</option>
                            </select></li>
        
                            <li hidden><select id="schools">
                                <option value="school">Select School</option>
                            </select></li>
        
                            <li hidden><select id="classes">
                                <option value="class">Select Class</option>
                            </select></li>
        
                            <li hidden>Find</li>
        
                            <li hidden>Create</li>
                        </ul>
                    </div>
                    
                    <div class="dates">
                        <h2>Availability</h2>
        
                        <ul>
                            <li><select>
                                <option value="Sunday">Sunday</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wedensday">Wedensday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                                <option value="Saturday">Saturday</option>
                            </select></li>

                            <li><select>
                                <option value="0:00">0:00</option>
                            </select></li>

                            <li>to</li>

                            <li></li>
                        </ul>

                        <button>Add</button>
                    </div>
                </div>
        
                <div class="calendar">
                    <table>
                        <tr>
                            <th>Sunday</th>
                        </tr>
                        <tr>
                            <th>Monday</th>
                        </tr>
                        <tr>
                            <th>Tuesday</th>
                        </tr>
                        <tr>
                            <th>Wedenesday</th>
                        </tr>
                        <tr>
                            <th>Thursday</th>
                        </tr>
                        <tr>
                            <th>Friday</th>
                        </tr>
                        <tr>
                            <th>Saturday</th>
                        </tr>
                    </table>
                </div>
            </section>
        </div>
    </form>
</body>
</html>