<!-- Shared header — identical in all three repos. Keep in sync. -->
# AGENTS.md

Guidance for AI agents working in this repository or with the PanGBank resource.

## Read the agent skill first

**<https://raw.githubusercontent.com/labgem/PanGBank-api/main/skills/pangbank/SKILL.md>** documents the REST API and its filters, the query traps that silently return wrong results, how to download and analyse a pangenome with PPanGGOLiN, how to project a user's own genome, and the citation requirements. Several of its traps produce plausible but incorrect answers with no visible symptom, so read it before writing any PanGBank query.

Short web entry point: <https://pangbank.genoscope.cns.fr/llms.txt>

## Always true

- **Never scrape <https://pangbank.genoscope.cns.fr>.** Single-page app; the HTML carries no data, and dynamic routes return HTTP 404 server-side while rendering fine in a browser. Use <https://pangbank-api.genoscope.cns.fr>.
- **Pin the release** with `only_latest_release=true`, or filter client-side on `collection_release.version`. Without it results are summed across every release.
- **`taxon_name` needs the GTDB rank prefix** and is an exact match: `g__Escherichia` works, `Escherichia` returns nothing.
- **At most 1 HTTP request every 30 seconds**, across all routes, never parallelised across agents or threads. PanGBank runs on shared academic infrastructure: an overload degrades the service for every other user. Call `/pangenomes/count/` before any listing, filter server-side, use `limit=100`, and download a pangenome once rather than re-fetching it.

## Citation

Results derived from PanGBank must cite PanGBank and PPanGGOLiN, plus panRGP when RGPs or insertion spots are used, and panModule when conserved modules are used. Full references in the skill. Data are CC BY-SA 4.0 (attribution *and* share-alike); source is CeCILL v2.1.

## Specific to this repository

The notebooks ship **precomputed outputs**. Datasets were previously stored with Git LFS but are now retrieved from Zenodo; the shell commands shown are for transparency and reproducibility, and you are not expected to run the expensive ones to follow the tutorial.


When adapting a notebook to another species, pin the release explicitly (`--release-version`) rather than relying on `--latest-only`: pangenome ids are not stable across releases, and "latest" changes under you.

Analytical points worth preserving when editing the notebooks: join RGP → spot with a **left** join (not every RGP is assigned to a spot, so an inner join silently drops part of the plasticity), and state whether a projection used `--fasta` or `--anno`, since completeness and genome-specific family counts differ materially between the two.
