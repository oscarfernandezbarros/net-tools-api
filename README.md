# Network Tools API

The Net Tools API is a deployable Mule application that you can deploy to CloudHub or any worker cloud. The application will then expose a very simple user interface that will allow you to perform basic network commands. The idea is that most network-related issues with your CloudHub VPC and VPN are related to connectivity to your on-premises systems, and most of those issues end up being resolved on the customer's end. If you have this tool available, you can work with your networking team to test connectivity to multiple on-premises systems and verify that your firewall and routing rules are working. It can also be used to generate traffic that can help diagnose network problems.

This supports both HTTP and HTTPS connections with a configurable port for each.

## Characteristics

- DNS lookups
- ping
- Route tracking
- Open a TCP socket
- Simple curl request
- Extract SSL certificates
- Check supported ciphers for a given SSL/TLS endpoint
## Versions

The application is maintained from the Mule Labs git account. The Mulesoft platform team maintains v2.5.1 in this repository with the following fixes:
- The http option, HTTP port `httpListener=stopped`, is disabled.
- The variable **autodiscovery** is incorporated for API Manager and inclusion of policies. (IPAllowList)
- The file **setWebResourcePayload.dwl** is modified, introducing error control for resource not found.
- The **execute** function of **NetworkUtils** is modified to handle possible failures in the input stream.


# Use
The use of this application is detailed step by step from the [network-Tool documentation](https://cloudfirst.cepsacorp.com/books/integration-development-guidelines/page/network-connectivity-tools).

The user interface can be accessed using the base URL of the application. The options are listed below.

- CloudHub Shared Load Balancer: `http://{app-name}.{region}.cloudhub.io` where the app name and region are specific to the deployed app.
- Dedicated load balancer: `custom url`. See the *Settings* section to update the settings.

The user interface is protected by basic authentication and the default credentials are listed in the *Settings* section.

# Setting
The following properties can be configured in the application to override the default settings. Appropriate ports must be configured to accommodate the configuration of the VPC firewall and load balancer rules. The default configuration is for the CloudHub shared load balancer HTTP endpoint.

- `user`: Username to log in. The default value is `uybscf8bny7w8cjn`
- `pass`: Password to log in. The default value is `784c87383nhnv354`
- `httpsPort`: Set the listening port for HTTPS. Default is `8082` (HTTP port `httpListener=stopped` is disabled)
- `httpListener`: The execution status of the HTTP endpoint flows. The default value is "started". Options: `started` or `stopped`. Stop this to disable the HTTP endpoint on CloudHub 1.0 or non-RTF infrastructure. This does not affect RTF or CloudHub 2.0 because only one HTTP port is used.
- `ignoreFiles`: Comma-delimited list of browser-requested resource files that this application should ignore. The default value is `favicon.ico`.