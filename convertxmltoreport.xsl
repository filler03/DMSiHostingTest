<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:template match="/">
   <html>
      <head>
         <title>E-Commerce Data for FileID <xsl:value-of select="Transmission/@FileID"/></title>
      </head>
      <body>
         <table border="0" cellpadding="2" cellspacing="0" width="100%">
            <tr>
               <td bgcolor="003399">
                  <font face="Arial" size="2" color="FFFFFF"><b>File ID: <xsl:value-of select="Transmission/@FileID"/>
                    <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Processing Date: <xsl:value-of select="Transmission/@CreatedDate"/>
                    <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Source: <xsl:value-of select="Transmission/@Source"/>
                    <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Processing Status: <xsl:value-of select="Transmission/@ProcessStatus"/></b>
                  </font>
               </td>
            </tr>
         </table>
         <xsl:apply-templates></xsl:apply-templates>
      </body>
   </html>
</xsl:template>

<xsl:template match="ECForm">
   <xsl:for-each select=".">
      <xsl:choose>
          <xsl:when test="@FormType='R846'">
              <table border="0" cellpadding="2" cellspacing="0" width="100%">
                      <tr>
                              <td bgcolor="003399" colspan="16"><b><font face="Arial Narrow" size="1" color="FFFFFF">R846 Version: <xsl:value-of select="@ver"/></font></b></td>
                      </tr>
                      <xsl:for-each select="INVINQ">
                      <tr>
                              <td>
                                      <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                              <tr>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Start Date</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">End Date</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">PO Number</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Reference</font></th>
                                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Vendor No</font></th>
                                              </tr>
                                              <tr>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/startdate"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/enddate"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Reference"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNo"/></font></td>
                                              </tr>
                                       </table>
                              </td>
                      </tr>
                      <xsl:for-each select="Body">
                      <xsl:for-each select="LineItem">
                      <tr>
                              <td>
                                      <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                              <tr>
                                                      <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Line #</font></th>
                                                      <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Part Number</font></th>
                                                      <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Short Desc</font></th>
                                              </tr>
                                              <tr>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                              </tr>
                                      </table>
                              </td>
                      </tr>
                          <tr>
                              <td>
                              <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                  <tr>
                                          <th  width="20px;"/>
                                          <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty Type</b></font></th>
                                          <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty</b></font></th>
                                          <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UOM</b></font></th>
                                  </tr>
                                      <xsl:for-each select="Activity">
                                          <tr>
                                                  <td  width="20px;"/>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="code"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="qty"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="uom"/></font></td>
                                                  <td><font face="Arial Narrow" size="1"></font></td>
                                          </tr>
                                      </xsl:for-each>
                              </table>
                              </td>
                          </tr>
                      </xsl:for-each>
                      </xsl:for-each>
                      </xsl:for-each>
          </table>
          </xsl:when>
          
          
           <xsl:when test="@FormType='R180'">
              <table border="0" cellpadding="2" cellspacing="0" width="100%">
                      <tr>
                              <td bgcolor="003399" colspan="16"><b><font face="Arial Narrow" size="1" color="FFFFFF">R180 Version: <xsl:value-of select="@ver"/></font></b></td>
                      </tr>
                      <xsl:for-each select="ReturnAuth">
                      <tr>
                         <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">
										        <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/>
										        <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font>
								        </th>
                      </tr>
                      <tr>
                          <td>
                              <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                <tr>
                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                  <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">RTV Number</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">RTV Date</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">RTV Time</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept No</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept Name</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Store Name</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust PO</font></th>
				                          <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Key Rec</font></th>
				                        </tr>
				                        <tr> 
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                  <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>  
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>                       
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processDate"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processTime"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptNo"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptName"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/storeName"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custPO"/></font></td>
				                          <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/keyRec"/></font></td>
                                </tr>
                              </table>
                          </td>
                      </tr>
                      <xsl:for-each select="Head/SAC">
                      <tr>
                              <td>
                                      <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                              <tr>
                                                      <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Total Amount</font></th>
                                                      <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">UOM</font></th>
                                                      <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Total Qty</font></th>
                                              </tr>
                                              <tr>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="unit"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="qty"/></font></td>
                                              </tr>
                                      </table>
                              </td>
                      </tr>
                      </xsl:for-each>
                      <xsl:for-each select="Body/LineItem">
                      <tr>
                              <td>
                                      <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                              <tr>
                                                      <td width="20px;"/>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Line #</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Cust Part #</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Order Qty</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">UOM</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Unit Price</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Item</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Reason Code</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Short Desc</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Merch Type Code</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Orig Receipt Date</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">RDC #</font></th>
                                                      <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1">Tag #</font></th>
                                              </tr>
                                              <tr>
                                                      <td width="20px;"/>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="Product/bnpid"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="qty"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="unit"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="unitPrice"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="Product/bndid"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="reasonCode"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="Product/shDesc"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="merchTypeCode"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="origReceiptDate"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="rdcNo"/></font></td>
                                                      <td><font face="Arial Narrow" size="1"><xsl:value-of select="tagNo"/></font></td>
                                              </tr>
                                              <xsl:for-each select="comments">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="10"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                              </xsl:for-each>
                                      </table>
                              </td>
                      </tr>
                      
                      </xsl:for-each>
                      </xsl:for-each>
                      
          
              </table>
          </xsl:when>
          
          
          
         <xsl:when test="@FormType='R850'">
            <table border="0" cellpadding="2" cellspacing="0" width="100%">
               <tr>
                   <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">R850 Version: <xsl:value-of select="@ver"/></font></b></td>
               </tr>
                        <xsl:for-each select="PO">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">
        <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/>
        <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font>
        </th>
      </tr>
      <tr>
        <td>
                          <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Buyer Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ordered By</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">PO Number</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Branch</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sale Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Purpose</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Reference</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Job</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust Order #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pay Terms Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Freight Terms</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Int Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Program No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dest Org</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Hold</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Route</font></th>                                                        
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordtxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordbuyName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderedBy"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/branch"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/saletype"/></font></td>                                                        
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/purpose"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/quoteID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/JobCostInfo/custJobNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PayTermsCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/mode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/programNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderHold"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/route"/></font></td>                                                        
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Delivery Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cancel By</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Via</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Via Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Partner Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ext</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Fax</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"></font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDateType"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CancelByCutoff/cutoffDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/shipVia"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/shipViaName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/fax"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <xsl:for-each select="Head/SAC">
                                                <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Qualifier</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Percent</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Handling</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="qualifier"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Percent"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Handling"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/comments">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                    <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Head/tranNotes">                        
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                    <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Note:</b></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="tranNote"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>                        
                        </xsl:for-each>
                        <xsl:for-each select="Body">
      <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust Part #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept Name</b></font></td>
                                                </tr>
                                                <xsl:for-each select="LineItem">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./poLineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptName"/></font></td>
                                                </tr>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="10"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
          </xsl:when>
          <xsl:when test="@FormType='R852'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="16"><b><font face="Arial Narrow" size="1" color="FFFFFF">R852 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="ACT">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Start Date</font></th>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">End Date</font></th>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept No</font></th>
                                                    <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Vendor No</font></th>
                                                </tr>
                                                <tr>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/startdate"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/enddate"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptNo"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                </tr>
                                         </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Line #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Item Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Part Number</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">UPC Code</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="upc"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <xsl:for-each select="id/loc">
                            <tr>
                                    <td>
                                            <tr>
                                                    <th><font face="Arial Narrow" size="1">Code Type</font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Org ID</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty Type</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UOM</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dollars</b></font></th>
                                            </tr>
                                            <tr>
                                                    <td><font face="Arial Narrow" size="1"></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="org"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@type"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="qty"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="../uom"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"></font></td>
                                            </tr>
                                            <xsl:for-each select="amt">
                                            <tr>
                                                    <th><font face="Arial Narrow" size="1">Code Type</font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Org ID</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty Type</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UOM</b></font></th>
                                                    <th bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dollars</b></font></th>
                                            </tr>
                                            <tr>
                                                    <td><font face="Arial Narrow" size="1"></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="../org"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="@Type"/></font></td>
                                                    <td><font face="Arial Narrow" size="1"></font></td>
                                                    <td><font face="Arial Narrow" size="1"></font></td>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="@amt"/></font></td>
                                            </tr>
                                            </xsl:for-each>
                                    </td>
                            </tr>
                            </xsl:for-each>
                        </table>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
            </table>
            </xsl:when>
          <xsl:when test="@FormType='R864'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="16"><b><font face="Arial Narrow" size="1" color="FFFFFF">R864 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <td>
                                <table border="0" cellpadding="2" cellspacing="0" width="20%">
                                    <tr>
                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Form Type</font></th>
                                    </tr>
                                    <tr>
                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@ControlNo"/></font></td>
                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@AgilPrivate"/></font></td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="2" cellspacing="0" width="20%">
                                    <tr>
                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Messages</font></th>
                                    </tr>
                                </table>

                        </td>
                        <xsl:for-each select="Msg">
                                <tr>
                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@MsgTxt"/></font></td>
                                </tr>
                        </xsl:for-each>
                </table>
            </xsl:when>
          <xsl:when test="@FormType='R820'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="16"><b><font face="Arial Narrow" size="1" color="FFFFFF">R820 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="INCVM">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th colspan="11" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                                                </tr>
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Payment Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pay Method</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Check #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Card #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Expiration Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Wire Tran #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sendors ABA No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sendor Acct No</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/payDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/payAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/method"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/checkNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/cardNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/expDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/wireTranNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/abaAcctNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/acctNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/TermsOfSale/PaymentMethod/chargebacks">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td  width="20px;"/>
                                                        <td width="100px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Charge Back:</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Code</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qualifier</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Reference</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="code"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="qualifier"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="refNumber"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="40px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust PO</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Amt Paid</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Discount Amt</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td width="40px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./InvoiceInfo/tranId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./InvoiceInfo/custPO"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/totalAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/discAmt"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="comments">
                        <tr>
                                <td width="20px;"/>
                                <td width="50px;"/>
                                <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="chargebacks">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="60px;"/>
                                                        <td width="100px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Charge Back:</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Code</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qualifier</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Reference</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td width="60px;"/>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="code"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="qualifier"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="refNumber"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
                </xsl:when>
          <xsl:when test="@FormType='R823'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="16"><b><font face="Arial Narrow" size="1" color="FFFFFF">R823 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="deposit">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Lockbox ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Deposit Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Total Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Total Qty</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Total Checks</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Deposit Routing</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Deposit Account</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="lockboxID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="depositDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="depositAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="depositNumBatches"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="depositNumChecks"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="abaAcctNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="acctNo"/></font></td>
                                                </tr>
                                         </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Payee ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Payee Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Bank ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Bank Name</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="SupplierInfo/supplierId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="SupplierInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="OriginInfo/custId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="OrigigInfo/name"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="batch">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td  width="20px;"/>
                                                        <td width="100px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Batch:</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Batch ID</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Batch Amt</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Num Checks</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="batchID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="batchAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="batchNumChecks"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="INCVM">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th colspan="11" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                                                </tr>
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Customer Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Payment Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pay Method</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Check #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Card #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Expiration Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Wire Tran #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sendors ABA No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sendor Acct No</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/payDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/payAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/method"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/checkNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/cardNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/expDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/wireTranNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/abaAcctNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/acctNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="40px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust PO</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Amt Paid</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Discount Amt</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td width="40px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./InvoiceInfo/tranId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./InvoiceInfo/custPO"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/totalAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/discAmt"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
                </xsl:when>
                <xsl:when test="@FormType='R810'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">R810 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="Invoice">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Invoice #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">PO #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">A/P Recon ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Invoice Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Discountable Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Due Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Terms Desc</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/billingBnld"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/totalAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/discountableAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountDueDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/netDueDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/termsDesc"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ext</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Fax</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Email</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Billing</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/fax"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/email"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Delivery</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/fax"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/email"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/comments">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Head/SAC">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Body">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;" />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Supp Part#</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO#</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cost</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Disc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ext Cost</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty UOM</b></font></td>
                                                </tr>
                                                <xsl:for-each select="LineItem">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/discAmt "/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./extPrice"/></font></td>
                                                </tr>
                                                <xsl:for-each select="alternate">
                                                    <tr>
                                                        <td width="20px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../DeliveryInfo/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Totals/invoiceQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Totals/discAmt "/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../extPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="altunit"/></font></td>
                                                    </tr>
                                                </xsl:for-each>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                <xsl:for-each select="SAC">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
    </xsl:when>

                <xsl:when test="@FormType='ITDS PP'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">ITDS PP Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="PO">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Exp Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Tran ID</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship To</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Fabricator</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Contact/name"/></font></td>
                                                        <td></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/name"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Customer</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/custId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/shiptoId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/countryCode"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Delivery</font></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/comments">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Body">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;" />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cost</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                </tr>
                                                <xsl:for-each select="LineItem">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./listunitPrice"/></font></td>
                                                </tr>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
    </xsl:when>

                <xsl:when test="@FormType='R855'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">R855 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="PO">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Purpose</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ack Status</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ack Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ack Time</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Exp Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Exp Receipt Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Tran ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pick Up ID</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/purpose"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/status"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processTime"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/pickupID"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Branch</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Contact</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ext</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Fax</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Supplier</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/branch"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Contact/fax"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Billing</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/branch"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Address/countryCode"/></font></td>
                                                        <td></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/fax"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Delivery</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/branch"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/fax"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/comments">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Body">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;" />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Part#</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>List Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>List UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Exp Receipt Date</b></font></td>
                                                </tr>
                                                <xsl:for-each select="LineItem">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./listunitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./listunit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/dlvDate"/></font></td>
                                                </tr>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
    </xsl:when>
                <xsl:when test="@FormType='R856'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">R856 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="ASN">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">SCAC Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Carrier Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dest Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Shipping Notes</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Rail Route</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/scacCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/CarrierName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/TransportNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/TransportType"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/TransportCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/xdoctxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordtxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/ShippingNotes"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/RailRoute"/></font></td>
                                                </tr>
                                      </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                              <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Packing Slip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Delv Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Delv Time</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Time</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/dlvTime"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processTime"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Origin Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/countryCode"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Destination Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                            <xsl:for-each select="Head/comments">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                             </tr>
                                        </table>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <xsl:for-each select="Body/Container">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="20px;"/>
                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Container ID/Tracking Number</b></font></td>
                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Lading Qty</b></font></td>
                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Pack Size</b></font></td>
                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ship Weight</b></font></td>
                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ship Weight UOM</b></font></td>
                                            </tr>
                                            <tr>
                                                <td />
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="ContainerNo"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="LadingQty"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="PackSize"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="ShipWeight"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="ShipWeightUOM"/></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <xsl:for-each select="OrderInfo">
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="30px;"/>
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Branch</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tran Id</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Verbal PO</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Reference</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>BOL No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PRO No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Date</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Supplier ID</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Int Vendor No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Merch Vendor No</b></font></td>
                                                    </tr>
                                                    <tr>
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="branch"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="OrderId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Reference"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="BolNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="trackingNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="orderDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="supplierId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="intvendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="vendorNo"/></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <xsl:for-each select="LineItem">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td width="40px;"/>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Line No</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Supp Part #</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                                <td colspan="2" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Desc</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Lot</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tag/Roll</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Weight</b></font></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="40px;"/>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="poLineNo"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                                <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pkgId"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pkgSubId"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/unitWeight"/></font></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="40px;"/>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice UOM</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Unit Price</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt UOM</b></font></td>
                                                                <td height="1" bgcolor="D4D0C8" align="left" colspan="4"/>
                                                            </tr>
                                                            <tr>
                                                                <td width="40px;"/>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQty"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQtyUom"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                                <td colspan="4"/>
                                                            </tr>
                                                            <tr>
                                                                <td width="40px;"/>
                                                                <td colspan="13"><hr></hr></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <xsl:for-each select="comments">
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="40px;"/>
                                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="DetailLineItem">
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="60px;"/>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Desc</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Lot</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tag/Roll</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Weight</b></font></td>
                                                                      <td height="1" bgcolor="D4D0C8" align="left"/>
                                                                    </tr>
                                                                    <tr>
                                                                        <td />
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pkgId"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pkgSubId"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/unitWeight"/></font></td>
                                                                      <td />
                                                                    </tr>
                                                                    <tr>
                                                                        <td />
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty</b></font></td>
                                                                        <td colspan="2" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice UOM</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Unit Price</b></font></td>
                                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt UOM</b></font></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td />
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQty"/></font></td>
                                                                        <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQtyUom"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="60px;"/>
                                                                        <td colspan="10"><hr></hr></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <xsl:for-each select="comments">
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="60px;"/>
                                                                                <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </xsl:for-each>
                                                        </tr>
                                                    </xsl:for-each>
                                                </tr>
                                            </xsl:for-each>
                                        </tr>
                                    </xsl:for-each>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                </table>
                </xsl:when>
                <xsl:when test="@FormType='APINV'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">APINV Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="Invoice">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font></th>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Batch #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Supplier ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Seq</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Invoice #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Branch</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Status</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@BatchNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/date"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/branch"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/status"/></font></td>
                                                </tr>
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Invoice Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Discountable Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Amt</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Due Date</font></th>
                                                        <th colspan="5" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Terms Desc</font></th>

                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/totalAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/discountableAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountDueDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/netDueDate"/></font></td>
                                                        <td colspan="5"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/termsDesc"/></font></td>
                                                </tr>
                                                <xsl:for-each select="Head/Totals/acct">
                                                <tr>
                                                        <td>
                                                                <table border="0" cellpadding="2" cellspacing="0">
                                                                        <tr>
                                                                                <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Account</b></font></td>
                                                                                <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="acctNo"/></font></td>
                                                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="subTotal"/></font></td>
                                                                        </tr>
                                                                </table>
                                                        </td>
                                                </tr>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ext</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Fax</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Email</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Billing</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/fax"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/BillingInfo/Contact/email"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1">Delivery</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneExt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/fax"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/email"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/comments">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Head/SAC">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Body/OrderInfo">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="20px;" />
                                                    <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>PO#</b></font></td>
                                                </tr>
                                                <tr>
                                                    <td width="20px;"/>
                                                    <td><font face="Arial Narrow" size="1"><xsl:value-of select="custOrderNo"/></font></td>
                                                </tr>
                                                <xsl:for-each select="LineItem">
                                                <tr>
                                                        <td width="20px;" />
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Supp Part#</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cost</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Disc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ext Cost</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Alt Qty UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO#</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Total Amt</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/discAmt "/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./extPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../Totals/subTotal"/></font></td>
                                                </tr>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td width="70px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                <xsl:for-each select="SAC">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="50px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                </xsl:for-each>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
    </xsl:when>
                <xsl:when test="@FormType='S180'">  
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="21"><b><font face="Arial Narrow" size="1" color="FFFFFF">S180 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="ReturnNotif">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>                                                      
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">RGA #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">RTV #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Approved By</font></th>
                                                        
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@To"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td> 
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td> 
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/approvedBy"/></font></td>                                                   
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th width="40px;"/>
                                                        <th height="1" width="100px;" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Line #</b></font></th>
                                                        <th height="1" width="100px;" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></th>
                                                        <th height="1" width="100px;" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust Part #</b></font></th>
                                                        <th height="1" width="100px;" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Denial Reason</b></font></th>
                                                        <th height="1" width="100px;" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Denial Notes</b></font></th>
                                                        <th height="1" width="100px;" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tag #</b></font></th>                                                        
                                                </tr>
                                                <tr>
                                                        <td width ="40px;"/>
                                                        <td width="100px;" ><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                        <td width="100px;" ><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td width="100px;" ><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>                                                        
                                                        <td width="100px;" ><font face="Arial Narrow" size="1"><xsl:value-of select="./reasonCode"/></font></td>
                                                        <td width="100px;" ><font face="Arial Narrow" size="1"><xsl:value-of select="./reasonDesc"/></font></td>
                                                        <td width="100px;" ><font face="Arial Narrow" size="1"><xsl:value-of select="./tagNo"/></font></td>                                                        
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
                </xsl:when>
                <xsl:when test="@FormType='S810'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="21"><b><font face="Arial Narrow" size="1" color="FFFFFF">S810 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="Invoice">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dest Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Buyer Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sale Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Tran ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ordered By</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Branch</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Reference</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Job</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">PO #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Orig Invoice</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Remit-to Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Int Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Remit-to Int Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Program No</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@To"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordtxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordbuyName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/saletype"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderedBy"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/branchSuffix"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Reference"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/origtxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TransportNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNoRt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNoRt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/programNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Delivery Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Terms Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Terms Desc</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Via</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Via Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">SCAC Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Delivery Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/mode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/termsDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/shipVia"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/shipViaName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/scacCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Phone/phoneNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust Supplier ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Cust Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/custId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/supplierId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/countryCode"/></font></td>
                                                </tr>
                                                <tr>
                                                       <td />
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                       <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                       <td />
                                                       <td><font face="Arial Narrow" size="1">Cust Ship-to Info</font></td>
                                                       <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/name"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street2"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street3"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/city"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/stateOrProvince"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/postalCode"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/countryCode"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Phone/phoneNo"/></font></td>
                                               </tr>
                                                 <tr>
                                                        <td />
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th colspan="3" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Ship-from Info</font></td>
                                                        <td colspan="3"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/countryCode"/></font></td>
                                                </tr>
                                                 <tr>
                                                        <td />
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th colspan="3" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                 </tr>
                                                 <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Remit-to Info</font></td>
                                                        <td colspan="3"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/countryCode"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Percent</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Due Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Net Due Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Amount</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Amount Due</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Due Days</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Days</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Net Terms</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Terms X-Ref</font></th>
                                                 </tr>
                                                 <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountPercent"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountDueDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/netDueDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountAmtDue"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/dueDays"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/discDays"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/netTerms"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PayTermsCode"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">ADF Amount</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sales Tax</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Discountable Amount</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Weight</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Total Amount</font></th>
                                                 </tr>
                                                 <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/adfAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/salesTax"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/discountableAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/weight"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/totalAmt"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/SAC">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <xsl:for-each select="Head/comments">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment</b></font></td>
                                                        <td colspan="21"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Container/Tracking number</b></font></td>
                                                        <td colspan="21"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/trackingNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>                        
                        <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="30px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Part #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust Part #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ext Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept Name</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./poLineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/extDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptName"/></font></td>
                                                        </tr>
                                                </table>
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                        <tr>
                                                        <td width="30px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Weight</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Bill Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ext Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally UOM</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/unitWeight"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./BillQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./extPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/priceUom"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQtyUom"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                </tr>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Container/Tracking number</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="./trackingNo"/></font></td>
                                                </tr>                                                
                                                <tr>
                                                        <td />
                                                        <td colspan="12"><hr></hr></td>
            </tr>
          </table>
        </td>
      </tr>
      </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
                </xsl:when>
                <xsl:when test="@FormType='S850'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="21"><b><font face="Arial Narrow" size="1" color="FFFFFF">S850 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="PO">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Generation Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Branch</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Tran ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pick Up ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Purchase Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Reference</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Verbal PO</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">PO Customer</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ordered By</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Confirmed By</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Buyer 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Buyer 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Buyer Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@To"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@Type"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/pickupID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderType"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/purpose"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/custId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderedBy"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/confirmedBy"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Contact2/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Contact/Phone/phoneNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th width="100px;" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Supplier ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Supplier Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/supplierId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/countryCode"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <th width="100px;" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td ><font face="Arial Narrow" size="1">Remit-to Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Phone/phoneNo"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <th width="100px;" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Distributor ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Supplier Cust ID</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td ><font face="Arial Narrow" size="1">Distributor Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/distNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/suppcustId"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th width="100px;" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Delivery Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Freight Terms Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Freight Terms Desc</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Via</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Via Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Rail Route</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Payment Terms Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Payment Terms Desc</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust PO</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Delivery Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/mode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/termsDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/shipVia"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/shipViaName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/RailRoute"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PayTermsCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PayTermsDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Phone/phoneNo"/></font></td>
                                                </tr>
                                                
                            </table>
                          </td>
            </tr>
            <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th width="100px;" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Customer Ship-to Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Phone/phoneNo"/></font></td>
                                                </tr>
                                                <xsl:for-each select="Head/comments">
	                                                <tr>
	                                                        <td />
	                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment</b></font></td>
	                                                        <td colspan="13"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
	                                               </tr>
                                               </xsl:for-each>
                                       
                                        </table>
                                </td>
            </tr>
      <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Line #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Product ID</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Exp Receipt Date</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./@lineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/dlvDate"/></font></td>
                                                </tr>
                                                <xsl:for-each select="./Product/extDescs">
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td width="40px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ext Desc:</b></font></td>
                                                        <td colspan="12"><font face="Arial Narrow" size="1"><xsl:value-of select="extDesc"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                       </table>
                                       <td />
                                 </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SupRef Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SupRef Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SupRef UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Costing Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Costing Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Costing UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                              </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./BillQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                </tr>
                                                <xsl:for-each select="comments">
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td width="100px;" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Comment:</b></font></td>
                                                        <td colspan="6"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
            </tr>
                                                </xsl:for-each>
          </table>
        </td>
      </tr>
      <tr>
        <td><hr></hr></td>
      </tr>
                        </xsl:for-each>
                        </xsl:for-each>
            </xsl:for-each>
                </table>
                </xsl:when>
                <xsl:when test="@FormType='S855'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="21"><b><font face="Arial Narrow" size="1" color="FFFFFF">S855 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="POAck">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dest Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Buyer Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sale Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Tran ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ordered By</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ack Status</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Status</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Reference</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust PO</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Job</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Remit-to Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Int Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Remit-to Int Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Program No</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@To"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordtxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordbuyName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/saletype"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderedBy"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/purpose"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Reference"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/JobCostInfo/custJobNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNoRt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNoRt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/programNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust Supplier ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Cust Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/supplierId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/countryCode"/></font></td>
                                                </tr>
                                                <tr>
                                                       <td />
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                       <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                       <td />
                                                       <td><font face="Arial Narrow" size="1">Cust Ship-to Info</font></td>
                                                       <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/name"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street2"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street3"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/city"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/stateOrProvince"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/postalCode"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/countryCode"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Phone/phoneNo"/></font></td>
                                                </tr>
                                                <tr>
                                                       <td />
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                       <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                       <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                               </tr>
                                               <tr>
                                                       <td />
                                                       <td><font face="Arial Narrow" size="1">Ship-from Info</font></td>
                                                       <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/name"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street2"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street3"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/city"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/stateOrProvince"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/postalCode"/></font></td>
                                                       <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/countryCode"/></font></td>
                                               </tr>
                                                <tr>
                                                        <td />
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Remit-to Info</font></td>
                                                        <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/countryCode"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Delivery Info</font></td>
                                                        <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Phone/phoneNo"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Total</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Delivery Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Freight Terms Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Percent</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Due Days</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Disc Days</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pay Terms X-Ref</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Pay Terms Desc</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Date Basis</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Totals/totalAmt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/fob"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/discountPercent"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/dueDays"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PaymentMethod/discDays"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/PayTermsCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/netTerms"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TermsOfSale/BasisDateCode"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Head/SAC">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>SAC Segment:</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Indicator</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Charge Code</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Description</b></font></td>
                                                        <td height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Amount</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Indicator"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ChargeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="chrgDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Amount"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
              <xsl:for-each select="Body">
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="30px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Detail Status</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Delivery Date</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept Name</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./poLineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/ItemStatus"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptName"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price in Order UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty in Price UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally UOM</b></font></td>
                                                        <td colspan="5"/>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPriceInOrderUOM"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qtyInPriceUOM"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                <td colspan="5"/>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td colspan="12"><hr></hr></td>
            </tr>
          </table>
        </td>
      </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
                </xsl:when>
                <xsl:when test="@FormType='S856'">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                                <td bgcolor="003399" colspan="21"><b><font face="Arial Narrow" size="1" color="FFFFFF">S856 Version: <xsl:value-of select="@ver"/></font></b></td>
                        </tr>
                        <xsl:for-each select="ASN">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dispatch ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">SCAC Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Carrier Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Transport Code</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dest Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Buyer Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sale Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Time</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@To"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@OrgID"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/CarrierId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/CarrierDetail/mode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TransportNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TransportType"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/TransportCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordtxnRefId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordbuyName"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/saletype"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processTime"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="10px;"/>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Origin Info</font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/custId"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/OriginInfo/Phone/phoneNo"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                        <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1">Destination Info</font></td>
                                                        <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Phone/phoneNo"/></font></td>
                                                </tr>
                                              <xsl:for-each select="Head/comments">
                                                <tr>
                                                        <td />
                                                        <td width="100px;" height="1" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1"><b>Comment</b></font></td>
                                                        <td colspan="8"><font face="Arial Narrow" size="1"><xsl:value-of select="comment"/></font></td>
                                                </tr>
                                              </xsl:for-each>
          </table>
        </td>
      </tr>
              <xsl:for-each select="Body/Container">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tare/Pack</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Container ID/Tracking Number</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Lading Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Pack Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ship Weight</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ship Weight UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Height</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="TarePack"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ContainerNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="LadingQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="PackSize"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ShipWeight"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="ShipWeightUOM"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="length"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="width"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="height"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="OrderInfo">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                   <td width="30px;"/>
                                                   <td />
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust PO</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tran Id</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Job</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Reference</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Terms Code</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Branch</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Date</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>BOL No</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust Supplier ID</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Merch Vendor No</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Remit-to Merch Vendor No</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Int Vendor No</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Remit-to Int Vendor No</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PRO No</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Delivery Date</b></font></td>
                                                   <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Delivery Time</b></font></td>
                                                </tr>
                                                <tr>
                                                   <td />
                                                   <td />
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="custOrderNo"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="OrderId"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="JobNo"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="Reference"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="FreightTerm"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="BranchSuffix"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="orderDate"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="BolNo"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="supplierId"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="vendorNo"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="vendorNoRt"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="intvendorNo"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="intvendorNoRt"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="trackingNo"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="DelvDate"/></font></td>
                                                   <td><font face="Arial Narrow" size="1"><xsl:value-of select="DelvTime"/></font></td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="LineItem">
                        <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="40px;"/>
                                                        <td />
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line No</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Size</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Weight</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept No</b></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="poLineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/size"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/unitWeight"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="deptNo"/></font></td>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td />
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty</b></font></td>
                                                        <td colspan="2" height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Invoice Qty UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally UOM</b></font></td>
                                                        <td colspan="4"/>
                                                </tr>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td />
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQty"/></font></td>
                                                        <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/invoiceQtyUom"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                                        <td colspan="4"/>
                                                <tr>
                                                        <td />
                                                        <td />
                                                        <td />
                                                        <td colspan="11"><hr></hr></td>
                                                </tr>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        </xsl:for-each>
                  </xsl:for-each>
                        </xsl:for-each>
            </xsl:for-each>
    </table>
         </xsl:when>
         <xsl:when test="@FormType='S870'">
         <table border="0" cellpadding="2" cellspacing="0" width="100%">
                 <tr>
                         <td bgcolor="003399" colspan="21"><b><font face="Arial Narrow" size="1" color="FFFFFF">S870 Version: <xsl:value-of select="@ver"/></font></b></td>
                 </tr>
                 <xsl:for-each select="ORDRPT">
                 <tr>
                         <td>
                                 <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                         <tr>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dest Org ID</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Org ID</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ord By Buyer Name</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Sale Type</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Tran ID</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Date</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Status 870</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Status Reason 870</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Requested Delivery Date</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Ship Date</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">PO Type</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Reference</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust PO</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Job</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept No</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Dept Name</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Remit-to Merch Vendor No</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Int Vendor No</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Remit-to Int Vendor No</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Program No</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Date</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Time</font></th>
                                         </tr>
                                         <tr>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@To"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@OrgID"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/internalTxnNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordtxnRefId"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/ordbuyName"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/saletype"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/txnRefId"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderDate"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/ShipStatus"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/ShipStatusReason"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/origDlvDate"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/shipDate"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/typeCode"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/Reference"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/JobCostInfo/custJobNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/deptName"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNoRt"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/intvendorNoRt"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/programNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processDate"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processTime"/></font></td>
                                         </tr>
                                 </table>
                         </td>
                 </tr>
                 <tr>
                         <td>
                                 <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                         <tr>
                                                 <td width="10px;"/>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust Supplier ID</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td><font face="Arial Narrow" size="1">Cust Info</font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/supplierId"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/name"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street2"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/street3"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/city"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/stateOrProvince"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/postalCode"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/CustInfo/Address/countryCode"/></font></td>
                                         </tr>
                                         <tr>
                                                <td />
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                         </tr>
                                         <tr>
                                                <td />
                                                <td><font face="Arial Narrow" size="1">Cust Ship-to Info</font></td>
                                                <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/name"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street2"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/street3"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/city"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/stateOrProvince"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/postalCode"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Address/countryCode"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact2/Phone/phoneNo"/></font></td>
                                         </tr>
                                         <tr>
                                                <td />
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                         </tr>
                                         <tr>
                                                <td />
                                                <td><font face="Arial Narrow" size="1">Ship-from Info</font></td>
                                                <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/name"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street2"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/street3"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/city"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/stateOrProvince"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/postalCode"/></font></td>
                                                <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/SupplierInfo/Address/countryCode"/></font></td>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                 <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td><font face="Arial Narrow" size="1">Remit-to Info</font></td>
                                                 <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/name"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street2"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/street3"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/city"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/stateOrProvince"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/postalCode"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Contact/Address/countryCode"/></font></td>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Type</font></th>
                                                 <th colspan="2" bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Name</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 1</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 2</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Address 3</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">City</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">State</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Zip</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Country</font></th>
                                                 <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Phone</font></th>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td><font face="Arial Narrow" size="1">Delivery Info</font></td>
                                                 <td colspan="2"><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/name"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street2"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/street3"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/city"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/stateOrProvince"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/postalCode"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Address/countryCode"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/Phone/phoneNo"/></font></td>
                                         </tr>
                                 </table>
                         </td>
                 </tr>
          <xsl:for-each select="Body">
                 <xsl:for-each select="LineItem">
                 <tr>
                         <td>
                                 <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                         <tr>
                                                 <td width="30px;"/>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line No</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Thickness</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Width</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Length</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Piece Count</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Short Desc</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Status 870</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Status Reason 870</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Delivery Date</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept No</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Dept Name</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Carrier Name</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SCAC Code</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ship Via</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Ship Via Name</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Transport No</b></font></td>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./poLineNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/thickness"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/width"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/length"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/pieceCnt"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/shDesc"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/ShipStatus"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/ShipStatusReason"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/dlvDate"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptNo"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./deptName"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/CarrierDetail/CarrierName"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/CarrierDetail/CarrierId"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/CarrierDetail/shipVia"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/CarrierDetail/shipViaName"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/CarrierDetail/trackingNo"/></font></td>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order UOM</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price in Order UOM</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>BO Qty</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>BO Qty UOM</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Qty</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally Unit Price</b></font></td>
                                                 <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Tally UOM</b></font></td>
                                                 <td colspan="5"/>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/boQty"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Totals/boQtyUom"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altQty"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunitPrice"/></font></td>
                                                 <td><font face="Arial Narrow" size="1"><xsl:value-of select="./altunit"/></font></td>
                                          <td colspan="5"/>
                                         </tr>
                                         <tr>
                                                 <td />
                                                 <td colspan="18"><hr></hr></td>
          </tr>
        </table>
      </td>
    </tr>
                 </xsl:for-each>
                 </xsl:for-each>
                 </xsl:for-each>
         </table>
         </xsl:when>
         <xsl:when test="@FormType='R870'">
            <table border="0" cellpadding="2" cellspacing="0" width="100%">
               <tr>
                   <td bgcolor="003399"><b><font face="Arial Narrow" size="1" color="FFFFFF">R870 Version: <xsl:value-of select="@ver"/></font></b></td>
               </tr>
                        <xsl:for-each select="ORDRPT">
                        <tr>
                                <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">
        <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Branch:<xsl:text>&#xA0;</xsl:text><xsl:value-of select="@Branch"/>
        <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>Status:<xsl:text>&#xA0;&#xA0;</xsl:text><xsl:value-of select="@Status"/></font>
        </th>
      </tr>
      <tr>
        <td>
                          <table border="0" cellpadding="2" cellspacing="0" width="100%">
                            <tr>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Control #</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Mailbox</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Org ID</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Cust PO</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Merch Vendor No</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Process Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Order Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Expected Date</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Status 870</font></th>
                                                        <th bgcolor="4E84C0" align="left"><font color="FFFFFF" face="Arial Narrow" size="1">Status Reason 870</font></th>
                                                </tr>
                                                <tr>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@ControlNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="../@From"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="@OrgID"/></font></td>                                                   
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/custOrderNo"/></font></td>                                                        
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/vendorNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/processDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/orderDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/ShipStatus"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="Head/DeliveryInfo/ShipStatusReason"/></font></td>                                                       
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                        <xsl:for-each select="Body">
                            <tr>
                                <td>
                                        <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>PO Line #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Item</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Cust Part #</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>SKU</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>UPC</b></font></td>                                                    
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Order Qty</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Qty UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Unit Price</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Price UOM</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Expected Date</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Status 870</b></font></td>
                                                        <td height="1" bgcolor="D4D0C8" align="left"><font face="Arial Narrow" size="1"><b>Status Reason 870</b></font></td>
                                                                                                                                                               
                                                </tr>
                                                <xsl:for-each select="LineItem">
                                                <tr>
                                                        <td width="20px;"/>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./poLineNo"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bndid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/bnpid"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/sku"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./Product/upc"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/qty"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./PurchasedOrderQty/unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unitPrice"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./unit"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/dlvDate"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/ShipStatus"/></font></td>
                                                        <td><font face="Arial Narrow" size="1"><xsl:value-of select="./DeliveryInfo/ShipStatusReason"/></font></td>
                                                </tr>
                                                </xsl:for-each>
                                        </table>
                                </td>
                            </tr>
                        </xsl:for-each>
                        </xsl:for-each>
                </table>
          </xsl:when>
      </xsl:choose>
   </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
