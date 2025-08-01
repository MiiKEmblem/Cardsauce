local consumInfo = {
    name = 'Don Beveridge Customerization Seminar',
    key = 'donbeveridge',
    set = "VHS",
    cost = 3,
    alerted = true,
    config = {
        activation = true,
        extra = {
            runtime = 5,
            uses = 0
        },
        activated = false,
        destroyed = false,
    },
    origin = {
        'rlm',
        'rlm_bs',
        color = 'rlm'
    }
}


function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "vhs_activation", set = "Other"}
    info_queue[#info_queue+1] = {key = "csau_artistcredit", set = "Other", vars = { G.csau_team.chvsau } }
    return { vars = { card.ability.extra.runtime-card.ability.extra.uses } }
end

function consumInfo.can_use(self, card)
    if to_big(#G.consumeables.cards) < to_big(G.consumeables.config.card_limit) or card.area == G.consumeables then return true end
end

return consumInfo