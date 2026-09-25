-- Reusable slides for haskoli-islands-revealjs. Details come from YAML
-- (the title slide itself is built from the same fields by title-slide.html):
--
--   title: / subtitle: / date:
--   event: "Conference name"
--   presenter:
--     name, position, department, email, phone, office, web, orcid, github
--
-- {{< hi-contact >}}          closing slide with contact details (title="..." optional)
-- {{< pause 300 >}}           break slide with a countdown in seconds

local function str(v)
  if v == nil then return nil end
  local s = pandoc.utils.stringify(v)
  if s == "" then return nil end
  return s
end

local function escape(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

local function is_icelandic(meta)
  local lang = str(meta["lang"]) or ""
  return lang:lower():sub(1, 2) == "is"
end

local function kwarg(kwargs, key)
  return str(kwargs[key])
end

local function bg_attrs(kwargs)
  local bg = kwarg(kwargs, "background")
  if not bg then return {} end
  return {
    ["background-image"] = bg,
    ["background-size"] = "cover",
    ["background-position"] = "center",
  }
end

local function presenter(meta)
  local p = meta["presenter"] or {}
  local function get(key) return str(p[key]) end
  return {
    name = get("name") or str(meta["author"]),
    position = get("position"),
    department = get("department"),
    email = get("email"),
    phone = get("phone"),
    office = get("office"),
    web = get("web"),
    orcid = get("orcid"),
    github = get("github"),
  }
end

local function link(href, text, icon)
  local i = icon and ('<i class="' .. icon .. ' fa-fw" aria-hidden="true"></i> ') or ""
  local external = href:match("^https?:") and ' target="_blank" rel="noopener noreferrer"' or ""
  return '<a href="' .. escape(href) .. '"' .. external .. '>' .. i .. escape(text) .. '</a>'
end

local function hi_contact(args, kwargs, meta)
  local p = presenter(meta)
  local heading = kwarg(kwargs, "title") or (is_icelandic(meta) and "Takk fyrir" or "Thank you")

  local rows = {}
  local function row(html) table.insert(rows, '<div class="contact-row">' .. html .. '</div>') end
  if p.email then row(link("mailto:" .. p.email, p.email, "fa-solid fa-envelope")) end
  if p.phone then row(link("tel:" .. p.phone:gsub("%s", ""), p.phone, "fa-solid fa-phone")) end
  if p.web then row(link(p.web, p.web:gsub("^https?://", ""):gsub("/$", ""), "fa-solid fa-globe")) end
  if p.orcid then row(link("https://orcid.org/" .. p.orcid, p.orcid, "fa-brands fa-orcid")) end
  if p.github then row(link("https://github.com/" .. p.github, "@" .. p.github, "fa-brands fa-github")) end
  if p.office then row('<i class="fa-solid fa-building-columns fa-fw" aria-hidden="true"></i> ' .. escape(p.office)) end

  local who = {}
  if p.name then table.insert(who, '<div class="contact-name">' .. escape(p.name) .. '</div>') end
  local role = {}
  for _, v in ipairs({ p.position, p.department }) do table.insert(role, v) end
  if #role > 0 then table.insert(who, '<div class="contact-role">' .. escape(table.concat(role, " · ")) .. '</div>') end

  return pandoc.Blocks {
    pandoc.Header(2, pandoc.Inlines(heading), pandoc.Attr("contact", { "contact-slide" }, bg_attrs(kwargs))),
    pandoc.RawBlock("html",
      '<div class="contact-card">' .. table.concat(who) .. table.concat(rows) .. '</div>'),
  }
end

local pause_count = 0

local function pause(args, kwargs, meta)
  local seconds = tonumber(str(args[1]) or "")
  if seconds == nil or seconds < 1 or seconds % 1 ~= 0 then
    return quarto.shortcode.error_output("pause",
      "Expected a positive whole number of seconds, e.g. {{< pause 300 >}}")
  end
  pause_count = pause_count + 1
  local label = kwarg(kwargs, "title") or (is_icelandic(meta) and "Pása" or "Break")
  return pandoc.Blocks {
    pandoc.Header(2, {}, pandoc.Attr("break-" .. pause_count, { "countdown-break" }, {
      ["background-color"] = "#2DD2C0",
      ["countdown-seconds"] = tostring(seconds),
    })),
    pandoc.RawBlock("html",
      '<h1>' .. escape(label) .. '</h1>\n' ..
      '<div class="countdown-clock" data-countdown-display>' ..
      string.format("%d:%02d", seconds // 60, seconds % 60) .. '</div>'),
  }
end

return {
  ["hi-contact"] = hi_contact,
  ["pause"] = pause,
}
