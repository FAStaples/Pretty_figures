function format_time_axis(ax, tplotrange)

    % Work on the given axis
    axes(ax);  %#ok<LAXES>

    % --- DAILY minor ticks ---
    xt_daily = floor(tplotrange(1)) : 1 : ceil(tplotrange(2));
    ax.XAxis.MinorTickValues = xt_daily;
    ax.XMinorTick = 'on';

    % --- MONTHLY major ticks ---
    % Pick out days that are the 1st of each month
    dv = datevec(xt_daily);
    is_first_of_month = dv(:,3) == 1;
    xt_monthly = xt_daily(is_first_of_month);

    ax.XTick = xt_monthly;

    % --- Labels: 'yyyy mmm' for Jan, 'mmm' for others ---
    labels = cell(size(xt_monthly));
    dv_month = datevec(xt_monthly);

    for k = 1:numel(xt_monthly)
        if dv_month(k,2) == 1          % January
            labels{k} = datestr(xt_monthly(k),'yyyy mmm');
        else
            labels{k} = datestr(xt_monthly(k),'mmm');
        end
    end

    ax.XTickLabel = labels;

    % --- Tick length: [major minor] ---
    ax.TickLength = [0.01 0.008];

    % Optional: minor grid
    % ax.XMinorGrid = 'on';
    % ax.MinorGridAlpha = 0.15;

end
