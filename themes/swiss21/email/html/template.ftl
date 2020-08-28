<#macro registrationLayout>
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="width=device-width">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><#nested "title"></title>
    </head>
    <body class="" style="background-color:#f5f5f7;font-family:HelveticaNeue,sans-serif;-webkit-font-smoothing:antialiased;font-size:16px;line-height:1.4;margin:0;padding:0;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%; text-align:center;">
    <table width="100%"  cellspacing="0" cellpadding="0">
        <tr style="border-collapse:collapse">
            <td style="background-color:#f5f5f7;">
            <table width="100%"  cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width:100%;background-color:#da211d;color:#fff;padding:10px;">
                        <h2 style="text-align:center; margin:0;"><#nested "title"></h2>
                    <td>
                </tr>
            </table>
            <table align="center" width="600">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr style="border-collapse:collapse">
                    <td style="background-color:#fff; padding:30px;" align="left">
                        <div style="margin-bottom: 27px;"><#nested "content"></div>
                        <#if link??>
                        <table cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center" width="300" height="40" bgcolor="#da211d"
                                    style="-webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; color: #ffffff; display: block;">
                                    <a href="${link}" style="font-size:14px;font-family:sans-serif; text-decoration: none; line-height:40px; width:100%; display:inline-block">
                                        <span style="color: #ffffff;">
                                            <#nested "title">
                                        </span>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        </#if>
                        <div style="font-size: 14px;line-height:1.43; color: #78838d"><#nested "contentAfter"></div>
                        <p style="margin-top: 60px;font-size:11px;color:#78838d;border-top:1px solid #e4e5e7;text-align: center;padding-top: 30px;">&copy; Abacus Research AG</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            </td>
        </tr>
    </table>
    </body>
    </html>
</#macro>
