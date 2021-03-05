function [x, f, stationarity] = solution(self)
    x = self.bestIterate.x;
    f = self.bestIterate.f;
    stationarityMeasure = self.bestIterate.stationarityMeasure;
end
