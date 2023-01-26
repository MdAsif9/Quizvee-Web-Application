<%-- 
    Document   : QuizAttempt
    Created on : 28-Jul-2022, 4:37:15 pm
    Author     : asifk
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
         <%
            String email = request.getParameter("user_email");
            String email1="";
           for(int i=2;i<email.length();i++){
                email1=email1+""+email.charAt(i);
             }
             String quiz=email.charAt(0)+""+email.charAt(1);
             String name ="";
            String [] Q=new String[5];
            String [] Op1=new String[5];
            String [] Op2=new String[5];
            String [] Op3=new String[5];
            String [] Op4=new String[5];

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizvee", "root", "Asif@1199");
                String q = "select * from Student";

                Statement stmt = con.createStatement();
                ResultSet set = stmt.executeQuery(q);
                while (set.next()){
                    if (email1.equals(set.getString(3))) {
                        name = set.getString(2);
                        break;
                    }
                }
                String q1="select * from "+quiz+"";
                
                int i=0;
                ResultSet set1=stmt.executeQuery(q1);
//                out.println("<h1>Executed</h1>");
                while(set1.next()){
                    Q[i]=set1.getString(2);
                    Op1[i]=set1.getString(3);
                    Op2[i]=set1.getString(4);
                    Op3[i]=set1.getString(5);
                    Op4[i]=set1.getString(6);
                    i++;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
        <nav style="background-color: #E7717D" class="navbar navbar-expand-lg shadow-lg rounded">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><h5>Quizvee</h5></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                        <a class="nav-link active" href="#">About</a>
                        <a class="nav-link active" href="#">Contact us</a>
                        <!--<a class="nav-link disabled">Disabled</a>-->
                    </div>
                </div>
            </div>
        </nav>
        <div style="text-align: center;padding: 5px;"><h1><%="Welcome " + name%></h1></div>
        <form method="POST" action="Generate_Certificate">
             
            <% out.println("<input type='hidden' name='user_name'  value=" + name + ">" );%>
            <% out.println("<input type='hidden' name='user_email'  value=" + email1 + ">" );%>
            <% out.println("<input type='hidden' name='user_table'  value=" + quiz + ">" );%>
            <table class="table">
               
                <!--Question Section-->

                <thead>
                <!--<h3>Enter Question</h3>-->
                <tr>
                    <th colspan="2" scope="col">
                        <div class="mb-3">
                            <label for="exampleFormControlinput1" class="form-label">Question 1</label>
                            <input class="form-control" id="exampleFormControlinput1" name="Q1" rows="3" placeholder="Type Your Question" value='<%out.println(Q[0 ]);%>' readonly></input>
<!--                            <span>or</span>
                            <input class="form-control" name="I1" type="file" id="formFile">-->
                        </div>
                        please check box for right answer
                    </th>
                </tr>

                </thead>
                <tbody>

                    <!--Option Upload Section-->

                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 1</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick1" value="Q1RA1" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q1OP1" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op1[0]);%>' readonly ></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q1I1" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 2</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick1" value="Q1RA2" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q1OP2" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op2[0]);%>' readonly ></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q1I2" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text"  id="addon-wrapping">Option 3</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick1" value="Q1RA3" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q1OP3" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op3[0]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q1I3" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 4 </span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick1" value="Q1RA4" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q1OP4" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op4[0]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q1I4" id="formFile">-->
                            </div>

                        </th>


                    </tr>

                </tbody>
            </table>
            <table class="table">

                <!--Question Section-->

                <thead>
                <!--<h3>Enter Question</h3>-->
                <tr>
                    <th colspan="2" scope="col">
                        <div class="mb-3">
                            <label for="exampleFormControlinput1" class="form-label">Question 2</label>
                            <input class="form-control" id="exampleFormControlinput1" name="Q2" rows="3" placeholder="Type Your Question"value='<%out.println(Q[1]);%>' readonly></input>
<!--                            <span>or</span>
                            <input class="form-control" type="file" name="I2" id="formFile">-->
                        </div>
                        please check box for right answer
                    </th>
                </tr>

                </thead>
                <tbody>

                    <!--Option Upload Section-->

                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 1</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick2" value="Q2RA1" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q2OP1" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op1[1]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q2I2" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 2</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick2" value="Q2RA2" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q2OP2" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op2[1]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q2I2" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 3</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick2" value="Q2RA3" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q2OP3" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op3[1]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q2I3" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 4 </span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick2" value="Q2RA4" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q2OP4" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op4[1]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q2I4" id="formFile">-->
                            </div>

                        </th>


                    </tr>

                </tbody>
            </table>
            <table class="table">

                <!--Question Section-->

                <thead>
                <!--<h3>Enter Question</h3>-->
                <tr>
                    <th colspan="2" scope="col">
                        <div class="mb-3">
                            <label for="exampleFormControlinput1" class="form-label">Question 3</label>
                            <input class="form-control" id="exampleFormControlinput1" name="Q3" rows="3" placeholder="Type Your Question" value='<%out.println(Q[2]);%>' readonly></input>
<!--                            <span>or</span>
                            <input class="form-control" type="file" name="I3" id="formFile">-->
                        </div>
                        please check box for right answer
                    </th>
                </tr>

                </thead>
                <tbody>

                    <!--Option Upload Section-->

                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 1</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick3" value="Q3RA1" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q3OP1" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op1[2]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q3I1" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 2</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick3" value="Q3RA2" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q3OP2" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op2[2]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q3I2" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 3</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick3" value="Q3RA3" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q3OP3" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op3[2]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q3I3" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 4 </span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick3" value="Q3RA4" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q3OP4" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op4[2]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q3I4" id="formFile">-->
                            </div>

                        </th>


                    </tr>

                </tbody>
            </table>
            <table class="table">

                <!--Question Section-->

                <thead>
           <!--<h3>Enter Question</h3>-->
                <tr>
                    <th colspan="2" scope="col">
                        <div class="mb-3">
                            <label for="exampleFormControlinput1" class="form-label">Question 4</label>
                            <input class="form-control" id="exampleFormControlinput1" name="Q4" rows="3" placeholder="Type Your Question" value='<%out.println(Q[3]);%>' readonly></input>
<!--                            <span>or</span>
                            <input class="form-control" type="file" name="I4" id="formFile">-->
                        </div>
                        please check box for right answer
                    </th>
                </tr>

                </thead>
                <tbody>

                    <!--Option Upload Section-->

                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 1</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick4" value="Q4RA1" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q4OP1" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input"value='<%out.println(Op1[3]);%>'readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q4I1" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 2</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick4" value="Q4RA2" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q4OP2" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op2[3]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q4I2" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 3</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick4" value="Q4RA3" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q4OP3" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op3[3]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q4I3" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 4 </span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick4" value="Q4RA4" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q4OP4" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input"value='<%out.println(Op4[3]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q4I4" id="formFile">-->
                            </div>

                        </th>


                    </tr>

                </tbody>
            </table>
            <table class="table">

                <!--Question Section-->

                <thead>
                <!--<h3>Enter Question</h3>-->
                <tr>
                    <th colspan="2" scope="col">
                        <div class="mb-3">
                            <label for="exampleFormControlinput1" class="form-label">Question 5</label>
                            <input class="form-control" id="exampleFormControlinput1" name="Q5" rows="3" placeholder="Type Your Question"value='<%out.println(Q[4]);%>' readonly></input>
<!--                            <span>or</span>
                            <input class="form-control" type="file" name="I5" id="formFile">-->
                        </div>
                        please check box for right answer
                    </th>
                </tr>

                </thead>
                <tbody>

                    <!--Option Upload Section-->

                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 1</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick5" value="Q5RA1" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q5OP1" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op1[4]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q5I1" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 2</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick5" value="Q5RA2" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q5OP2" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op2[4]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q5I2" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 3</span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick5" value="Q5RA3" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q5OP3" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op3[4]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q5I3" id="formFile">-->
                            </div>

                        </th>


                    </tr>
                    <tr>
                        <th colspan="2" scope="row">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Option 4 </span>
                                <div class="input-group-text">
                                    <input class="form-check-input mt-0" type="radio" name="tick5" value="Q5RA4" aria-label="Checkbox for following text input">
                                </div>
                                <!--<input type="text" class="form-control" aria-label="Text input with checkbox">-->
                                <input class="form-control" id="exampleFormControlinput1" name="Q5OP4" rows="1" placeholder="Enter your option" aria-label="Checkbox for following text input" value='<%out.println(Op4[4]);%>' readonly></input>
<!--                                <span class="input-group-text" id="addon-wrapping">or</span>
                                <input class="form-control" type="file" name="Q5I4" id="formFile">-->
                            </div>

                        </th>


                    </tr>

                </tbody>
            </table>
            <button  type='submit' >submit</button>
        </form>
    </body>
</html>
