/* jQuery Switchable v2.0 | switchable.mrzhang.me | MIT Licensed */
!
function(a) {
    function b(b, c, d) {
        var e = this,
        f = a(this),
        g = "beforeSwitch",
        h = "onSwitch";
        a.isFunction(c[g]) && f.bind(g, c[g]),
        a.isFunction(c[h]) && f.bind(h, c[h]),
        a.extend(e, {
            _initPlugins: function() {
                for (var b = a.switchable.Plugins,
                c = b.length,
                d = 0; c > d; d++) b[d].init && b[d].init(e)
            },
            _init: function() {
                if (e.container = b, e.config = c, e.panels = !c.panels || !c.panels.jquery && "string" !== a.type(c.panels) ? b.children() : b.find(c.panels), e.length = Math.ceil(e.panels.length / c.steps), e.length < 1) return void(window.console && console.warn("No panel in " + d));
                if (e.index = null === c.initIndex ? void 0 : c.initIndex + (c.initIndex < 0 ? e.length: 0), "none" === c.effect && e.panels.slice(e.index * c.steps, (e.index + 1) * c.steps).show(), c.triggers) {
                    var f, g, h, i = [];
                    for (g = 1; g <= e.length; g++) i.push('<a href="javascript:;">' + g + "</a>");
                    for (c.triggers.jquery ? c.triggers.length > 1 ? e.triggers = c.triggers.slice(0, e.length) : 0 == c.triggers.children().length ? (c.triggers.html('<div class="' + c.triggersWrapCls + '">' + i.join("") + "</div>"), e.triggers = c.triggers.find("a")) : e.triggers = c.triggers: e.triggers = a("<div />", {
                        "class": c.triggersWrapCls,
                        html: i.join("")
                    })[c.putTriggers](b).find("a"), e.triggers.eq(e.index).addClass(c.currentTriggerCls), g = 0; g < e.length; g++) f = e.triggers.eq(g),
                    f.click({
                        index: g
                    },
                    function(a) {
                        h = a.data.index,
                        e._triggerIsValid(h) && (e._cancelDelayTimer(), e.switchTo(h))
                    }),
                    "mouse" === c.triggerType && f.mouseenter({
                        index: g
                    },
                    function(a) {
                        h = a.data.index,
                        e._triggerIsValid(h) && (e._delayTimer = setTimeout(function() {
                            e.switchTo(h)
                        },
                        1e3 * c.delay))
                    }).mouseleave(function() {
                        e._cancelDelayTimer()
                    })
                }
            },
            _triggerIsValid: function(a) {
                return e.index !== a
            },
            _cancelDelayTimer: function() {
                e._delayTimer && (clearTimeout(e._delayTimer), e._delayTimer = void 0)
            },
            _switchTrigger: function(a, b) {
                e.triggers.eq(a).removeClass(c.currentTriggerCls).end().eq(b).addClass(c.currentTriggerCls)
            },
            _switchPanels: function(b, d, f) {
                a.switchable.Effects[c.effect].call(e, b, d, f)
            },
            willTo: function(a) {
                return a ? e.index > 0 ? e.index - 1 : c.loop ? e.length - 1 : !1 : e.index < e.length - 1 ? e.index + 1 : c.loop ? 0 : !1
            },
            switchTo: function(b, d) {
                var i = a.Event(g);
                return f.trigger(i, [b]),
                i.isDefaultPrevented() ? void 0 : (e._switchPanels(e.index, b, d), !c.triggers || e._switchTrigger(e.index, b), e.index = b, i.type = h, f.trigger(i, [b]), e)
            }
        }),
        e._init(),
        e._initPlugins()
    }
    a.switchable = {
        Config: {
            triggers: !0,
            putTriggers: "insertAfter",
            triggersWrapCls: "triggers",
            currentTriggerCls: "current",
            panels: null,
            steps: 1,
            triggerType: "mouse",
            delay: .1,
            initIndex: 0,
            effect: "none",
            easing: "ease",
            duration: .5,
            loop: !0,
            beforeSwitch: null,
            onSwitch: null,
            api: !1
        },
        Effects: {
            none: function(a, b) {
                var c = this,
                d = c.config;
                c.panels.slice(a * d.steps, (a + 1) * d.steps).hide().end().slice(b * d.steps, (b + 1) * d.steps).show()
            }
        },
        Plugins: []
    },
    a.fn.switchable = function(c) {
        var d, e = a(this),
        f = e.length,
        g = e.selector,
        h = [];
        for (c = a.extend({},
        a.switchable.Config, c), c.effect = c.effect.toLowerCase(), d = 0; f > d; d++) h[d] = new b(e.eq(d), c, g + "[" + d + "]");
        return c.api ? h[0] : e
    }
} (jQuery),
function(a) {
    function b() {
        var a, b = document.documentElement,
        c = ["Webkit", "Moz"],
        d = "transition",
        e = "";
        if (void 0 !== b.style[d]) e = d;
        else for (a = 0; 2 > a; a++) if (void 0 !== b.style[d = c[a] + "Transition"]) {
            e = d;
            break
        }
        return e
    }
    a.switchable.Anim = function(c, d, e, f, g, h) {
        var i, j, k = this,
        l = {};
        void 0 === a.switchable.Transition && (a.switchable.Transition = b()),
        i = a.switchable.Transition,
        a.extend(k, {
            isAnimated: !1,
            run: function() {
                if (!k.isAnimated) {
                    if (e = 1e3 * e, i) l[i + "Property"] = h || "all",
                    l[i + "Duration"] = e + "ms",
                    l[i + "TimingFunction"] = f,
                    c.css(a.extend(d, l)),
                    j = setTimeout(function() {
                        k._clearCss(),
                        k._complete()
                    },
                    e);
                    else {
                        var b = /cubic-bezier\(([\s\d.,]+)\)/,
                        g = f.match(b),
                        m = a.switchable.TimingFn[f]; (m || g) && (f = a.switchable.Easing(g ? g[1] : m.match(b)[1])),
                        c.animate(d, e, f,
                        function() {
                            k._complete()
                        })
                    }
                    return k.isAnimated = !0,
                    k
                }
            },
            stop: function(a) {
                return k.isAnimated ? (i ? (clearTimeout(j), j = void 0) : c.stop(!1, a), k.isAnimated = !1, k) : void 0
            },
            _complete: function() {
                g && g()
            },
            _clearCss: function() {
                l[i + "Property"] = "none",
                c.css(l)
            }
        })
    }
} (jQuery),
function(a) {
    function b(a) {
        return "cubic-bezier(" + a + ")"
    }
    function c(a) {
        var b, c = [],
        d = 101;
        for (b = 0; d >= b; b++) c[b] = a.call(null, b / d);
        return function(a) {
            if (1 === a) return c[d];
            var b = d * a,
            e = Math.floor(b),
            f = c[e],
            g = c[e + 1];
            return f + (g - f) * (b - e)
        }
    }
    function d(a, b, c, d, e, f) {
        function g(a) {
            return ((m * a + bx) * a + cx) * a
        }
        function h(a) {
            return ((ay * a + by) * a + cy) * a
        }
        function i(a) {
            return (3 * m * a + 2 * bx) * a + cx
        }
        function j(a) {
            return 1 / (200 * a)
        }
        function k(a, b) {
            return h(l(a, b))
        }
        function l(a, b) {
            function c(a) {
                return a >= 0 ? a: 0 - a
            }
            var d, e, f, h, j, k;
            for (f = a, k = 0; 8 > k; k++) {
                if (h = g(f) - a, c(h) < b) return f;
                if (j = i(f), c(j) < 1e-6) break;
                f -= h / j
            }
            if (d = 0, e = 1, f = a, d > f) return d;
            if (f > e) return e;
            for (; e > d;) {
                if (h = g(f), c(h - a) < b) return f;
                a > h ? d = f: e = f,
                f = .5 * (e - d) + d
            }
            return f
        }
        var m = bx = cx = ay = by = cy = 0;
        return cx = 3 * b,
        bx = 3 * (d - b) - cx,
        m = 1 - cx - bx,
        cy = 3 * c,
        by = 3 * (e - c) - cy,
        ay = 1 - cy - by,
        k(a, j(f))
    }
    a.switchable.TimingFn = {
        ease: b(".25, .1, .25, 1"),
        linear: b("0, 0, 1, 1"),
        "ease-in": b(".42, 0, 1, 1"),
        "ease-out": b("0, 0, .58, 1"),
        "ease-in-out": b(".42, 0, .58, 1")
    },
    a.switchable.Easing = function(e) {
        var f, g, h = 0;
        for (e = e.split(","), g = e.length; g > h; h++) e[h] = parseFloat(e[h]);
        if (4 !== g) window.console && console.warn(b(e.join(", ")) + " missing argument.");
        else if (f = "cubic-bezier-" + e.join("-"), !a.easing[f]) {
            var i = c(function(a) {
                return d(a, e[0], e[1], e[2], e[3], 5)
            });
            a.easing[f] = function(a) {
                return i.call(null, a)
            }
        }
        return f
    }
} (jQuery),
function(a) {
    a.extend(a.switchable.Config, {
        autoplay: !1,
        interval: 3,
        pauseOnHover: !0
    }),
    a.switchable.Plugins.push({
        name: "autoplay",
        init: function(b) {
            function c() {
                return g = b.willTo(b.isBackward),
                g === !1 ? void b._cancelTimers() : void b.switchTo(g, b.isBackward ? "backward": "forward")
            }
            function d() {
                f = setInterval(function() {
                    c()
                },
                1e3 * (h.interval + h.duration))
            }
            var e, f, g, h = b.config,
            i = !1; ! h.autoplay || b.length <= 1 || (h.pauseOnHover && b.panels.add(b.triggers).hover(function() {
                b._pause()
            },
            function() {
                i || b._play()
            }), a.extend(b, {
                _play: function() {
                    b._cancelTimers(),
                    b.paused = !1,
                    e = setTimeout(function() {
                        c(),
                        d()
                    },
                    1e3 * h.interval)
                },
                _pause: function() {
                    b._cancelTimers(),
                    b.paused = !0
                },
                _cancelTimers: function() {
                    e && (clearTimeout(e), e = void 0),
                    f && (clearInterval(f), f = void 0)
                },
                play: function() {
                    return b._play(),
                    i = !1,
                    b
                },
                pause: function() {
                    return b._pause(),
                    i = !0,
                    b
                }
            }), b._play())
        }
    })
} (jQuery),
function(a) {
    a.extend(a.switchable.Config, {
        prev: null,
        next: null
    }),
    a.switchable.Plugins.push({
        name: "carousel",
        init: function(b) {
            var c, d, e, f = b.config,
            g = ["backward", "forward"],
            h = ["prev", "next"],
            i = 0;
            if (f.prev || f.next) for (; 2 > i; i++) c = h[i],
            d = f[c],
            d && (e = b[c + "Btn"] = d.jquery ? d: a(d), e.click({
                direction: g[i]
            },
            function(a) {
                if (a.preventDefault(), !b.anim) {
                    var c = a.data.direction,
                    d = b.willTo(c === g[0]);
                    d !== !1 && b.switchTo(d, c)
                }
            }))
        }
    })
} (jQuery),
function(a) {
    a.switchable.Effects.fade = function(b, c) {
        var d = this,
        e = d.config,
        f = d.panels,
        g = f.eq(b),
        h = f.eq(c);
        d.anim && (d.anim.stop(), f.eq(d.anim.to).css({
            zIndex: d.length
        }).end().eq(d.anim.from).css({
            opacity: 0,
            zIndex: 1
        })),
        h.css({
            opacity: 1
        }),
        d.anim = new a.switchable.Anim(g, {
            opacity: 0
        },
        e.duration, e.easing,
        function() {
            h.css({
                zIndex: d.length
            }),
            g.css({
                zIndex: 1
            }),
            d.anim = void 0
        },
        "opacity").run(),
        d.anim.from = b,
        d.anim.to = c
    },
    a.switchable.Plugins.push({
        name: "fade effect",
        init: function(a) {
            var b = a.config,
            c = a.panels.eq(a.index);
            "fade" === b.effect && 1 === b.steps && (a.panels.not(c).css({
                opacity: 0,
                zIndex: 1
            }), c.css({
                opacity: 1,
                zIndex: a.length
            }))
        }
    })
} (jQuery),
function(a) {
    var b = ["scrollleft", "scrollright", "scrollup", "scrolldown"],
    c = "position",
    d = "absolute",
    e = "relative";
    a.extend(a.switchable.Config, {
        end2end: !1,
        groupSize: [],
        visible: null,
        clonedCls: "switchable-cloned"
    });
    for (var f = 0; 4 > f; f++) a.switchable.Effects[b[f]] = function(b, c, d) {
        var e = this,
        f = e.config,
        g = e.length - 1,
        h = "backward" === d,
        i = f.end2end && (h && 0 === b && c === g || "forward" === d && b === g && 0 === c),
        j = {};
        j[e.isHoriz ? "left": "top"] = i ? e._adjustPosition(h) : -e.groupSize[e.isHoriz ? 0 : 1] * c,
        e.anim && e.anim.stop(),
        e.anim = new a.switchable.Anim(e.panels.parent(), j, f.duration, f.easing,
        function() {
            i && e._resetPosition(h),
            e.anim = void 0
        }).run()
    };
    a.switchable.Plugins.push({
        name: "scroll effect",
        init: function(f) {
            var g = f.config,
            h = g.steps,
            i = f.panels,
            j = i.parent(),
            k = a.inArray(g.effect, b),
            l = 0 === k || 1 === k,
            m = i.eq(0).outerWidth(!0),
            n = i.eq(0).outerHeight(!0),
            o = l ? 0 : 1,
            p = f.length - 1,
            q = l ? "left": "top",
            r = {};
            if ( - 1 !== k) {
                if (f.groupSize = [g.groupSize[0] || m * h, g.groupSize[1] || n * h], g.end2end) {
                    var s, t = i.length,
                    u = !l && g.groupSize[0] ? f.groupSize[o] * f.length: (l ? m: n) * t,
                    v = t - p * h,
                    w = (l ? m: n) * v,
                    x = !l && g.groupSize[0] ? f.groupSize[o] : w;
                    g.loop = !0,
                    g.visible && g.visible < t && g.visible > v && i.slice(0, g.visible).clone(!0).addClass(g.clonedCls).appendTo(j).click(function(b) {
                        b.preventDefault(),
                        i.eq(a(this).index() - t).click()
                    }),
                    a.extend(f, {
                        _adjustPosition: function(a) {
                            return s = a ? p: 0,
                            r[c] = e,
                            r[q] = (a ? -1 : 1) * u,
                            i.slice(s * h, (s + 1) * h).css(r),
                            a ? x: -u
                        },
                        _resetPosition: function(a) {
                            s = a ? p: 0,
                            r[c] = "",
                            r[q] = "",
                            i.slice(s * h, (s + 1) * h).css(r),
                            r[c] = void 0,
                            r[q] = a ? -f.groupSize[o] * p: 0,
                            j.css(r)
                        }
                    })
                }
                "static" == f.container.css(c) && f.container.css(c, e),
                r[c] = d,
                r[q] = -f.groupSize[o] * f.index,
                j.css(r).css("width", l ? 2 * f.groupSize[o] * f.length: g.groupSize[0] ? g.groupSize[0] : void 0),
                f.isHoriz = l,
                f.isBackward = 1 === k || 3 === k
            }
        }
    })
} (jQuery),
function(a) {
    var b = ["accordion", "horizaccordion"],
    c = [["height", "marginTop", "marginBottom", "paddingTop", "paddingBottom", "borderTopWidth", "borderBottomWidth"], ["width", "marginLeft", "marginRight", "paddingLeft", "paddingRight", "borderLeftWidth", "borderRightWidth"]];
    a.extend(a.switchable.Config, {
        multiple: !1,
        customProps: {}
    });
    for (var d = 0; 2 > d; d++) a.switchable.Effects[b[d]] = function(b, c) {
        var d = this,
        e = d.config,
        f = b !== c;
        d.anim && d.anim.stop(f),
        d.anim = new a.switchable.Anim(d.panels.eq(c), d.triggers.eq(c).hasClass(e.currentTriggerCls) ? d.collapseProps: d.expandProps[c], e.duration, e.easing,
        function() {
            d.anim = void 0
        }).run(),
        !e.multiple && void 0 !== b && f && (d.anim2 && d.anim2.stop(f), d.anim2 = new a.switchable.Anim(d.panels.eq(b), d.collapseProps, e.duration, e.easing,
        function() {
            d.anim2 = void 0
        }).run())
    };
    a.switchable.Plugins.push({
        name: "accordion effect",
        init: function(d) {
            var e = d.config,
            f = a.inArray(e.effect, b);
            if ( - 1 !== f && 1 === e.steps) {
                window.console && console.info("Remember to set the border-width for the accordion's panels, even without border."),
                a.extend(d, {
                    _triggerIsValid: function() {
                        return ! 0
                    },
                    _switchTrigger: function(a, b) {
                        var c = d.triggers,
                        f = e.currentTriggerCls;
                        c.eq(b).toggleClass(f),
                        !e.multiple && void 0 !== a && a !== b && c.eq(a).removeClass(f)
                    }
                }),
                d.expandProps = [],
                d.collapseProps = {};
                var g, h, i, j = c[f].length,
                k = {};
                for (i = 0; j > i; i++) d.collapseProps[c[f][i]] = 0;
                for (a.extend(d.collapseProps, e.customProps), i = 0; i < d.length; i++) {
                    g = d.panels.eq(i);
                    for (var l = 0; j > l; l++) h = c[f][l],
                    k[h] = g.css(h);
                    d.expandProps.push(a.extend({},
                    k)),
                    g.css(a.extend({
                        overflow: "hidden"
                    },
                    i === d.index ? k: d.collapseProps))
                }
            }
        }
    })
} (jQuery);