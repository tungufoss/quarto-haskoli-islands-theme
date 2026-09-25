-- Slide features for haskoli-islands-revealjs:
--   * side banner, optional logo and title-slide "HÍ" badge
--   * countdown script for {{< pause >}} break slides
--   * Mentimeter login and question slides

local function str(v)
  if v == nil then return nil end
  local s = pandoc.utils.stringify(v)
  if s == "" then return nil end
  return s
end

local function escape(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

local function has_class(el, cls)
  for _, c in ipairs(el.classes) do
    if c == cls then return true end
  end
  return false
end

-- Menti settings: `menti: {url, code, qr, display-url}`.
-- The flat keys `menti_url`, `menti_code`, ... from quarto-hi also work.
local function menti_settings(meta)
  local m = meta["menti"] or {}
  local function get(key)
    return str(m[key]) or str(meta["menti_" .. key:gsub("-", "_")])
  end
  return {
    url = get("url"),
    code = get("code") or "",
    qr = get("qr"),
    display = get("display-url") or "www.menti.com",
  }
end

local function menti_login(h, menti)
  local intro = h.attributes["intro"] or "Join on Menti"
  h.attributes["intro"] = nil
  local qr = menti.qr and
    ('<img class="menti-qr" src="' .. escape(menti.qr) .. '" alt="Menti QR code">') or ""
  return pandoc.Blocks {
    h,
    pandoc.RawBlock("html",
      '<div class="menti-login-text">' ..
      '<span class="menti-kicker">Menti</span>' ..
      '<h2>' .. escape(intro) .. '</h2>' ..
      '<div class="menti-url">' .. escape(menti.display) .. '</div>' ..
      '<div class="menti-code">' .. escape(menti.code) .. '</div>' ..
      '</div>' .. qr)
  }
end

local function menti_question(h, menti)
  h.attributes["menti"] = nil
  if menti.url then
    h.attributes["background-iframe"] = menti.url
    h.attributes["background-interactive"] = "true"
  end
  local qr = menti.qr and
    ('<img class="menti-panel-qr" src="' .. escape(menti.qr) .. '" alt="Menti QR code">') or ""
  return pandoc.Blocks {
    h,
    pandoc.RawBlock("html",
      '<div class="menti-panel">' .. qr ..
      '<div class="menti-panel-url">' .. escape(menti.display) .. '</div>' ..
      '<div class="menti-panel-code">' .. escape(menti.code) .. '</div>' ..
      '</div>')
  }
end

function Pandoc(doc)
  if not quarto.doc.is_format("revealjs") then return nil end

  quarto.doc.add_html_dependency({
    name = "haskoli-islands-slides",
    version = "1.0.0",
    scripts = { "hi-slides.js" },
  })

  local logo = str(doc.meta["hi-logo"])
  local logo_html = logo and
    ('<img id="hi-logo" src="' .. escape(logo) .. '" alt="" aria-hidden="true">') or ""
  quarto.doc.include_text("before-body",
    '<div id="hi-banner" aria-hidden="true">' .. logo_html .. '</div>\n' ..
    '<div id="hi-badge" aria-hidden="true">HÍ</div>')

  local menti = menti_settings(doc.meta)
  return doc:walk({
    Header = function(h)
      if has_class(h, "menti-login") then
        return menti_login(h, menti)
      end
      if h.attributes["menti"] == "true" or h.attributes["data-menti"] == "true" then
        h.attributes["data-menti"] = nil
        return menti_question(h, menti)
      end
    end
  })
end
