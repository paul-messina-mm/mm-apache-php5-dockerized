describe("template spec", () => {
  it("passes", () => {
    cy.visit("http://localhost:8000/info.php");
    cy.contains("PHP Version 5.5.9")
    // cy.get("body").then(($body) => {
    //   console.log(`include ${$body.text().includes("INSIDE A GEM.")}`);
    //   if ($body.text().includes("INSIDE A GEM.")) {
    //     // yup found it
    //     //cy.get(...).should(...)
    //   } else {
    //     // nope not here
    //   }
    // });
  });
});
