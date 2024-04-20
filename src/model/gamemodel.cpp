#include "gamemodel.h"

GameModel::GameModel(QObject *parent)
    : QObject{parent}
{}

QString GameModel::name() const
{
    return mName;
}

QString GameModel::animal() const
{
    return mAnimal;
}

QString GameModel::type() const
{
    return mType;
}

unsigned char GameModel::difficulty() const
{
    return mDifficulty;
}

unsigned char GameModel::estimatedTime() const
{
    return mEstimatedTime;
}

unsigned char GameModel::minPeople() const
{
    return mMinPeople;
}

unsigned char GameModel::maxPeople() const
{
    return mMaxPeople;
}

QVariantList GameModel::description() const
{
    return mDescription;
}
