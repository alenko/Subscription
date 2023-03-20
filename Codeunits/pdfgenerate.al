/// <summary>
/// Codeunit PDF Generator (ID 50348).
/// </summary>
codeunit 50348 "PDF Generator"
{
    /// <summary>
    /// GenerateFromPage.
    /// </summary>
    /// <param name="Page">Page.</param>
    /// <param name="PageID">Integer.</param>
    procedure GenerateFromPage(Page: Page; PageID: Integer)
    {
        var
            HTMLDocument: TextBuilder;
            PDFDocument: DotNet "System.IO.MemoryStream";

            HTMLDocument.Clear();
        Page.RenderHtml(HTMLDocument);

        PDFDocument := DotNet
            "Microsoft.Dynamics.Nav.Types.Report.HtmlToPdfConverter"
            :New():
            ConvertHtmlToPdf(HTMLDocument.ToString());
    }

    procedure SaveToIncomingDocuments(FileName: Text)
    {
        var
            Blob: DotNet "System.IO.MemoryStream";
                      IncomingDocument: Record "Incoming Document";

                      IncomingDocument.Init();
                      IncomingDocument.SetBlob("Document", PDFDocument);
                      IncomingDocument.SetValue("File Name", FileName);
                      IncomingDocument.SetValue("Document Type", ".pdf");
                      IncomingDocument.Insert();
    }
}
