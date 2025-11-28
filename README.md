# Arbaz_NITPatna
OCR Extraction API (Rewritten & Plag-Free Description)

The OCR Extraction API is a FastAPI-powered microservice designed to read invoices and bills from image URLs and convert them into structured billing data. The system uses Tesseract OCR to analyze the text within the image and intelligently rebuilds the itemized table that appears on most bill formats.

🔍 Image-to-Text Conversion

The service performs optical character recognition on remote image files.
It works with a variety of image types including:

scanned invoices

smartphone photos

colored or low-quality bill images

Tesseract extracts both the text and its positional data, which is essential for rebuilding item rows accurately.

📑 Smart Table & Line-Item Extraction

The tool identifies table headers commonly found on invoices, such as:

Description / Item Name

Quantity

Rate or Unit Price

Gross / Net / Amount

Using the x- and y-coordinates of each recognized word, the API reconstructs each line item by grouping terms into their respective columns.

🧾 Well-Formatted JSON Output

Once the table is interpreted, the system outputs:

each item’s description

quantity value

rate or unit cost

total amount

Additional fields such as total item count and overall reconciled amount are also included, ensuring a clean and ready-to-use JSON response.

🌐 Simple and Clean FastAPI Interface

Users only need to supply a public image URL.
The API processes the image, extracts the table, and returns structured data in one endpoint.
Built-in error handling ensures stable responses, even when URLs fail or the OCR cannot extract valid data.

🛠️ Modular Project Design

The codebase is split into two main modules for clarity:

bill_extractor.py — handles downloading images, running Tesseract OCR, and building structured table data

app.py — contains the FastAPI route and request-response logic

This separation ensures easier maintenance, debugging, and upgrades.