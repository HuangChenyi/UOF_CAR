<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="ROOM">
		<html>
			<body>
				<!-- Header -->
				<table border="1">
					<tr>
						<td colspan="2">Chat Log</td>
					</tr>
					<tr>
						<td>Create Date</td>
						<td><xsl:value-of select="@CREATE_DATE"/></td>
					</tr>
					<tr>
						<td>Room Name</td>
						<td><xsl:value-of select="@ROOM_NAME" /></td>													
					</tr>
				</table>
				<p></p>				
				<!-- Detail -->
				<table border="1">
					<tr>
						<th>Create Date</th>
						<th>Index</th>
						<th>Log Type</th>						
						<th>Member</th>
						<th>Message</th>
					</tr>
					<xsl:for-each select="LOG">
						<xsl:sort select="LOG_INDEX" order ="ascending"/>
						<tr>
							<td>
								<xsl:value-of select="@CREATE_DATE" />
							</td>
							<td>
								<xsl:value-of select="@LOG_INDEX" />
							</td>
							<td>
								<xsl:value-of select="@LOG_TYPE" />
							</td>
							<td>
								<xsl:value-of select="MEMBER"/>
							</td>
							<td>
								<font>
									<xsl:attribute name="style">
										<xsl:value-of select="MESSAGE/@STYLE"/>
									</xsl:attribute>
									<xsl:value-of select="MESSAGE"/>
								</font>																									
							</td>
						</tr>
					</xsl:for-each>					
				</table>	    
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
