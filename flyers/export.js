// WhiteMoon flyer exporter — renders each HTML to PNG / PDF via Puppeteer.
// Usage: node export.js
const path = require("path");
const puppeteer = require("puppeteer");

const DIR = __dirname;
const url = (f) => "file://" + path.join(DIR, f);

const jobs = [
  { html: "spark.html",            out: "spark.png",            type: "png", w: 1080, h: 1350, scale: 2 },
  { html: "spark-instagram.html",  out: "spark-instagram.png",  type: "png", w: 1080, h: 1080, scale: 1 },
  { html: "spark-print.html",      out: "spark-print.pdf",      type: "pdf" },
  { html: "core.html",             out: "core.png",             type: "png", w: 1080, h: 1350, scale: 2 },
  { html: "core-instagram.html",   out: "core-instagram.png",   type: "png", w: 1080, h: 1080, scale: 1 },
  { html: "core-print.html",       out: "core-print.pdf",       type: "pdf" },
];

async function waitReady(page) {
  await page.evaluate(async () => {
    await document.fonts.ready;
  });
}

(async () => {
  const browser = await puppeteer.launch({
    headless: "new",
    args: ["--no-sandbox", "--disable-dev-shm-usage", "--force-color-profile=srgb"],
  });

  for (const job of jobs) {
    const page = await browser.newPage();
    try {
      if (job.type === "png") {
        await page.setViewport({ width: job.w, height: job.h, deviceScaleFactor: job.scale });
        await page.goto(url(job.html), { waitUntil: "networkidle0" });
        await waitReady(page);
        const el = await page.$(".canvas");
        await el.screenshot({ path: path.join(DIR, job.out), type: "png" });
        console.log(`PNG  ${job.out}  ${job.w * job.scale}x${job.h * job.scale}`);
      } else {
        await page.goto(url(job.html), { waitUntil: "networkidle0" });
        await waitReady(page);
        await page.pdf({
          path: path.join(DIR, job.out),
          format: "A4",
          printBackground: true,
          preferCSSPageSize: true,
        });
        console.log(`PDF  ${job.out}  A4`);
      }
    } catch (e) {
      console.error(`FAIL ${job.out}:`, e.message);
      process.exitCode = 1;
    } finally {
      await page.close();
    }
  }

  await browser.close();
  console.log("done.");
})();
